output "db_sg_id" {
  description = "ID of the db_sg"
  value       = aws_security_group.db_sg.id
}