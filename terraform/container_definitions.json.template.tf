
data "template_file" "container_definitions" {
  template = file("container_definitions.json")

  vars = {
#    account_id = data.aws_ssm_parameter.container_definitions__account_id.value
    POSTGRES_HOST = var.POSTGRES_HOST
    POSTGRES_DB = var.POSTGRES_DB
    POSTGRES_PW = var.POSTGRES_PW
    POSTGRES_USER = var.POSTGRES_USER
    account_id = data.aws_ssm_parameter.container_definitions__account_id.value
  }
  depends_on = [aws_ssm_parameter.container_definitions__account_id]
}
