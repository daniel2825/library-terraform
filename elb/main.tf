/*
resource "aws_elb" "LibraryElb" {
  name            = "Library_Elb"
  subnets         = ["${aws_subnet.subnetPrivateMederi.id}", "${aws_subnet.subnetPublicMederi.id}"]
  security_groups = ["${aws_security_group.securegroupPublic.id}"]

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

}*/