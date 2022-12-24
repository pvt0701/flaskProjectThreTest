resource "aws_db_instance" "default" {
  allocated_storage      = 20
  ca_cert_identifier     = "rds-ca-2019"
  db_subnet_group_name   = "db-subnet-group"
  engine_version         = "13.7"
  engine                 = "postgres"
  identifier             = "production"
  instance_class         = "db.t3.micro"
  db_name                = "postgres"
  parameter_group_name   = "default.postgres13"
  password               = data.aws_ssm_parameter.db_instance__password.value
  username               = "postgres"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_instance.id]
}
