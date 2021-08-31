output "ssh_sg_arn" {
    description = "ARN of the ssh_22-lb-sg"
    value = aws_security_group.ssh_22_sg.arn
}

output "ssh_sg_id" {
    description = "ID of the ssh_22-server-sg"
    value = aws_security_group.ssh_22_sg.id
}