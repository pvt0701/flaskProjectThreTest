resource "aws_db_instance" "default" {
  allocated_storage     = 20
  ca_cert_identifier   = "rds-ca-2019"
  db_subnet_group_name = "db-subnet-group"
  engine_version       = "13.7"
  engine               = "postgres"
  identifier           = "production"
  instance_class       = "db.t3.micro"
  db_name              = "postgres"
  parameter_group_name = "default.postgres13"
  password             = "postgres"
  username             = "postgres"
  skip_final_snapshot = true
  depends_on = [aws_db_subnet_group.default]
}
