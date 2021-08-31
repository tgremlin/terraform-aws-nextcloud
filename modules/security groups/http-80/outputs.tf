output "server_sg_arn" {
  description = "ARN of the http_80-server-sg"
  value       = aws_security_group.http_80_server.arn
}

output "lb_sg_arn" {
  description = "ARN of the http_80-lb-sg"
  value       = aws_security_group.http_80_lb.arn
}

output "server_sg_id" {
  description = "ID of the http_80-server-sg"
  value       = aws_security_group.http_80_server.id
}

output "lb_sh_id" {
  description = "ID of the http_80-lb-sg"
  value       = aws_security_group.http_80_lb.id
}