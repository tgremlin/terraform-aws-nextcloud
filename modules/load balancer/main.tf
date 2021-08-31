provider "aws" {
  region = var.region
}

resource "aws_lb" "alb" {
  name               = "${var.project}-ALB"
  load_balancer_type = var.lb_type
}

resource "aws_lb_target_group" "alb-tg" {
  port = 80
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn

  port     = 443
  protocol = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.ssl_cert_arn

  default_action {

    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn

  }
}