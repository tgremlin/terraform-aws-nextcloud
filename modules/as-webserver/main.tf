provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "as_webserver" {
  name_prefix     = lower("${var.project}-${var.environment}")
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = var.webserver_instance_type
  key_name        = var.key_name
  security_groups = [var.server_sg_id[0], var.db_sg[0], var.ssh_sg_id[0],var.instance_internet_sg_id[0]]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "as_placement_group" {
  name     = "${var.project}-placement-group"
  strategy = var.placement_strategy
}

resource "aws_autoscaling_group" "as_webserver_group" {
  name                      = "${var.project}-${var.environment}-webserver-as-group"
  max_size                  = var.as_max_size
  min_size                  = var.as_min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = true
  placement_group           = aws_placement_group.as_placement_group.id
  launch_configuration      = aws_launch_configuration.as_webserver.name
  vpc_zone_identifier       = var.public_subnets

  tags = [{
    Name        = "${var.project}-${var.environment}-as_webserver"
    Environment = "${var.environment}"
  }]

}