provider "aws" {
    region = var.region
}

resource "aws_security_group" "https_443_lb" {
    name = "https_443-${var.project}-sg"
    description = "Allow https on port 443 for ${var.project}"
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.project}-https443-lb-sg"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "ingress_443_all" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.https_443_lb.id
}

resource "aws_security_group" "https_443_server" {
    name = "https_443-${var.project}-from-lb-sg"
    description = "Allow https from load balancer on port 443 for ${var.project}"
    vpc_id = var.vpc_id

    tags = {
      Name = "${var.project}-https443-server-sg"
      Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "https_443_server" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    source_security_group_id = aws_security_group.https_443_lb.id
    security_group_id = aws_security_group.https_443_server.id
}