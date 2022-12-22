resource "aws_ecs_task_definition" "default" {
  container_definitions    = file("container_definitions.json")
  family                   = "blog"
  memory                   = 256
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
}