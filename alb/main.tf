
resource "aws_lb" "LibraryAlb" {
  name               = "Alb_library"
  load_balancer_type = "application"
  subnets            = [var.subnet_private_id, var.subnet_public_id]

  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "LibraryAlb_listener" {
  load_balancer_arn = aws_lb.LibraryAlb.arn

  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetLibraryPortTraffic.arn
  }
}

resource "aws_lb_target_group" "targetLibraryPortTraffic" {
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  load_balancing_algorithm_type = "least_outstanding_requests"

  stickiness {
    enabled = true
    type    = "lb_cookie"
  }

  health_check {
    healthy_threshold   = 2
    interval            = 30
    protocol            = "HTTP"
    unhealthy_threshold = 2
  }

  depends_on = [
    aws_lb.this
  ]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "autoScalingLibrary" {
  name                      = "autoScalingLibrary"
  launch_configuration      = "${aws_launch_configuration.serverAmiLibrary.id}"
  vpc_zone_identifier       = [var.subnet_private_id]


  min_size                  = 1
  desired_capacity          = 1
  max_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  
}

resource "aws_autoscaling_policy" "autoScalingPoliciesMederi" {
  name                    = "autoScalingPoliciesLibraryCpu"
  autoscaling_group_name  = "${aws_autoscaling_group.autoScalingLibrary.name}"
  policy_type             = "TargetTrackingScaling"
  metric_aggregation_type = "Average"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.percentage_cpu_scaling
  }

}

resource "aws_autoscaling_attachment" "target" {
  autoscaling_group_name = "${aws_autoscaling_group.autoScalingLibrary.id}"
  lb_target_group_arn   = aws_lb_target_group.targetLibraryPortTraffic.arn
}


