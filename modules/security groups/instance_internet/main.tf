provider "aws" {
  region = var.region
}

resource "aws_security_group" "instance_internet" {
  name        = "instance-internet-${var.project}-sg"
  description = "Allow internet traffic for ${var.project} web servers"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project}-instance-internet-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "ingress_internet" {
  type              = "ingress"
  from_port         = 1024
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance_internet.id
}

resource "aws_security_group_rule" "egress_internet" {
    type = "egress"
    from_port = 1024
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.instance_internet.id
}
