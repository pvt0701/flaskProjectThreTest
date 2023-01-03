resource "aws_ecs_service" "default" {
  cluster                 = aws_ecs_cluster.production.id
  depends_on              = [aws_iam_role_policy_attachment.ecs, aws_iam_role_policy_attachment.ssm]
  desired_count           = 1
  enable_ecs_managed_tags = true
  force_new_deployment    = true

  load_balancer {
    target_group_arn = aws_alb_target_group.default.arn
    container_name   = "app"
    container_port   = 5000

  }

  name            = "blog"
  task_definition = "${aws_ecs_task_definition.default.family}:${data.aws_ecs_task_definition.default.revision}"
}