provider "aws" {
    region = var.region
}

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project}-vpc"
    Environment = var.environment
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.project}-pub-sub-1"
    Environment = var.environment
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.project}-pub-sub-2"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.project}-priv-sub-1"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.project}-priv-sub-2"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-igw"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "${var.project}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_eip" "eip_1" {
  vpc      = true
}

resource "aws_eip" "eip_2" {
  vpc      = true
}



resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.eip_1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "${var.project}-nat-gw-1"
    Environment = var.environment
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_gw_2" {
  allocation_id = aws_eip.eip_2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = "${var.project}-nat-gw-2"
    Environment = var.environment
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}