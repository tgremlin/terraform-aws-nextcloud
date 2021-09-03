output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "public_subnet_1" {
    description = "ID of public subnet 1"
    value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
    description = "ID of public subnet 2"
    value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
    description = "ID of private subnet 1"
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
    description = "ID of private subnet 2"
    value = aws_subnet.private_subnet_2.id
}