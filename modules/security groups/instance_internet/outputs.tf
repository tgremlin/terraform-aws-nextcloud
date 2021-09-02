output "intance_internet_sg_arn" {
  description = "ARN of the instance internet security group"
  value       = aws_security_group.instance_internet.arn
}

output "instance_internet_sg_id" {
  description = "ID of the instance internet security group"
  value       = aws_security_group.instance_internet.id
}