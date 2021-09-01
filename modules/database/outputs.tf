output "rds_hostname" {
    description = "RDS Instance hostname"
    value = aws_db_instance.db.address
    sensitive = true
}

output "rds_port" {
    description = "RDS Instance Port"
    value = aws_db_instance.db.port
    sensitive = true
}

output "rds_username" {
    description = "RDS instance root username"
    value = aws_db_instance.db.username
    sensitive = true
}

output "rds_arn" {
    description = "RDS Instance ARN"
    value = aws_db_instance.db.arn
    sensitive = true
}

output "minor_upgrade" {
    description = "Status of automatic minor version upgrade"
    value = aws_db_instance.db.auto_minor_version_upgrade
}

output "db_backup_window" {
    description = "Selected backup window"
    value = aws_db_instance.db.backup_window
}

output "db_endpoint" {
    description = "RDS Instance endpoint"
    value = aws_db_instance.db.endpoint
}

output "db_engine" {
    description = "RDS Instance engine"
    value = aws_db_instance.db.engine
}

output "db_engine_version" {
    description = "RDS Instance engine version"
    value = aws_db_instance.db.engine_version
}

output "db_id" {
    description = "RDS Instance ID"
    value = aws_db_instance.db.id
    sensitive = true
}

output "db_instance_class" {
    description = "RDS Instance class"
    value = aws_db_instance.db.instance_class
}

output "db_latest_restore_time" {
    description = "RDS Instance latest restorable time"
    value = aws_db_instance.db.latest_restorable_time
}

output "db_max_storage" {
    description = "RDS Instance max storage"
    value = aws_db_instance.db.max_allocated_storage
}

output "db_multi_az" {
    description = "Status of multi-az setting"
    value = aws_db_instance.db.multi_az
}

output "db_replicas" {
    description = "RDS Instance read replicas"
    value = aws_db_instance.db.replicas
}

output "db_status" {
    description = "RDS Instance status"
    value = aws_db_instance.db.status
}