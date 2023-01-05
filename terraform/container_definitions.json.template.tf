
data "template_file" "container_definitions" {
  template = file("container_definitions.json")

  vars = {
    account_id = data.aws_ssm_parameter.container_definitions__account_id.value
  }
}
