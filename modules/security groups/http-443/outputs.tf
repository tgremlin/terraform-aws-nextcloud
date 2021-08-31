output "server_sg_arn" {
    description = "ARN of the https_443-server-sg"
    value = aws_security_group.https_443_server.arn
}

output "lb_sg_arn" {
    description = "ARN of the https_443-lb-sg"
    value = aws_security_group.https_443_lb.arn
}

output "server_sg_id" {
    description = "ID of the https_443-server-sg"
    value = aws_security_group.https_443_server.id
}

output "lb_sh_id" {
    description = "ID of the https_443-lb-sg"
    value = aws_security_group.https_443_lb.id
}