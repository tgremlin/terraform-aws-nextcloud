provider "aws" {
  region = var.region
}

resource "aws_security_group" "db_sg" {
  name        = "db-${var.project}-sg"
  description = "Allow http on port 80 for ${var.project}"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project}-db-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "db_sg_webserve" {
  type                     = "ingress"
  from_port                = var.db_from_port
  to_port                  = var.db_to_port
  protocol                 = "tcp"
  source_security_group_id = var.server_sg_id
  security_group_id        = aws_security_group.db_sg.id
}