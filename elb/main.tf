resource "aws_elb" "LibraryElb" {
  name            = "LibraryElb"
  subnets         = [var.subnet_private_id, var.subnet_public_id]
  security_groups = [var.security_group_public_id]

  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:3000/"
    interval            = 30
  }

}

resource "aws_lb_target_group" "targetLibraryPortTraffic" {
  name        = "targetLibraryPortTraffic"
  port        = 3000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_launch_configuration" "serverAmiLibrary" {
  name_prefix     = "autoScalingInstance"
  image_id        = var.ami_autoscaling
  instance_type   = var.instance_type_autoscaling
  security_groups = [var.security_group_private_id]
  key_name        = var.key_name_instances

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

resource "aws_autoscaling_attachment" "aws_attach_LibraryAutoscaling" {
  autoscaling_group_name = "${aws_autoscaling_group.autoScalingLibrary.id}"
  elb                    = "${aws_elb.LibraryElb.id}"
}
