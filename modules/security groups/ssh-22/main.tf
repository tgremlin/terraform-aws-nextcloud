provider "aws" {
    region = var.region
}

resource "aws_security_group" "ssh_22_sg" {
    name = "ssh_22-${var.project}-sg"
    description = "Allow ssh on port 22 for ${var.project}"
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.project}-ssh22-lb-sg"
        Environment = "${var.environment}"
    }
}

resource "aws_security_group_rule" "ingress_22_allowed" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.ssh_allowed
    security_group_id = aws_security_group.ssh_22_sg.id
}
