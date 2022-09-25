resource "aws_ecs_service" "fastapi_sample_svc" {
  name            = "fastapi_sample_svc"
  cluster         = data.aws_ecs_cluster.prashanna_ecs_cluster.id
  task_definition = aws_ecs_task_definition.fastapi_sample_task_definition.arn
  desired_count   = 3
  iam_role        = aws_iam_role.fastapi_sample_svc_role.arn
}