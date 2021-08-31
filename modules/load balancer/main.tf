provider "aws" {
  region = var.region
}

resource "aws_lb" "alb" {
  name               = "${var.project}-ALB"
  load_balancer_type = var.lb_type
    security_groups = var.lb_sg
}

# Because we are terminating with SSL at the load balancer, our
# target group can use HTTP.
resource "aws_lb_target_group" "alb-tg" {
  port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    load_balancing_algorithm_type = "least_outstanding_requests"

    stickiness {
      enabled = true
      type = "lb_cookie"
    }

  health_check {
    healthy_threshold   = 2
    interval            = 30
    protocol            = "HTTP"
    unhealthy_threshold = 2
  }

  depends_on = [
    aws_lb.alb
  ]

  lifecycle {
    create_before_destroy = true
  }

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
