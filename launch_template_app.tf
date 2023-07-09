data "template_file" "user_data_template_app" {
  template = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo systemctl enable apache2
    sudo systemctl start apache2
  EOT
}


resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.prod_key.id
  user_data     = base64encode(data.template_file.user_data_template_app.rendered)

  network_interfaces {
    security_groups             = [aws_security_group.prod_pri_sg.id]
    associate_public_ip_address = false
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "app-server"
    }
  }

}

#Create application load balancer
resource "aws_lb" "app_alb" {
  name                       = "app-alb"
  load_balancer_type         = "application"
  internal                   = false
  subnets                    = [aws_subnet.app1_pri_sub.id, aws_subnet.app2_pri_sub.id]
  enable_deletion_protection = false
  security_groups            = [aws_security_group.prodapp_lb_sg.id]

  depends_on = [
    aws_vpc.prod-vpc,
  ]
}

resource "aws_lb_target_group" "app-tg" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prod-vpc.id

  health_check {
    port     = 80
    protocol = "HTTP"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "app_listner" {
  load_balancer_arn = aws_lb.app_alb.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app-tg.id
    type             = "forward"
  }

}

#Create ASG
resource "aws_autoscaling_group" "app_asg_group" {
  name_prefix         = "app_asg"
  vpc_zone_identifier = [aws_subnet.app1_pri_sub.id, aws_subnet.app2_pri_sub.id]
  target_group_arns = [
    aws_lb_target_group.app-tg.arn
  ]
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [load_balancers]
  }
  desired_capacity          = 2
  max_size                  = 4
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }
} 

/*resource "aws_autoscaling_policy" "cpu_trigger_app" {
  name                   = "cpu-autoscaling-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.app_asg_group.id

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 70 # Adjust the target value as per your requirement
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_app" {
  alarm_name          = "cpu-autoscaling-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 85 # Adjust the threshold as per your requirement
  alarm_description   = "Alarm when CPU exceeds 85%"
  alarm_actions       = [aws_autoscaling_policy.cpu_trigger_app.arn]
  dimensions = {
    AutoScalingGroupName = "aws_autoscaling_group.app_asg_group"
  }
}*/





