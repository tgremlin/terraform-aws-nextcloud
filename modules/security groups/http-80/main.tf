provider "aws" {
  region = var.region
}

resource "aws_security_group" "http_80_lb" {
  name        = "http_80-${var.project}-sg"
  description = "Allow http on port 80 for ${var.project}"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project}-http80-lb-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "ingress_80_all" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_80_lb.id
}

resource "aws_security_group" "http_80_server" {
  name        = "http_80-${var.project}-from-lb-sg"
  description = "Allow http from load balancer on port 80 for ${var.project}"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project}-http80-server-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "http_80_server" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.http_80_lb.id
  security_group_id        = aws_security_group.http_80_server.id
}