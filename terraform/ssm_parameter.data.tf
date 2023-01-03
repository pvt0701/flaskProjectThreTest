data "aws_ssm_parameter" "container_definitions__account_id" {
  name  = "/terraform/${terraform.workspace}/CONTAINER_DEFINITIONS__ACCOUNT_ID"
#  depends_on = [data.aws_ssm_parameter.container_definitions__account_id]
}

data "aws_ssm_parameter" "db_instance__password" {
  name  = "/terraform/${terraform.workspace}/DB_INSTANCE__PASSWORD"
#  depends_on = [data.aws_ssm_parameter.db_instance__password]
}

data "aws_ssm_parameter" "key_pair__public_key" {
  name  = "/terraform/${terraform.workspace}/KEY_PAIR__PUBLIC_KEY"
#  depends_on = [aws_ssm_parameter.key_pair__public_key]
}