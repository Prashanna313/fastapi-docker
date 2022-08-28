resource "aws_ecs_task_definition" "fastapi_sample_task_definition" {
  family                   = "fastapi-sample"
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode([
    {
      name      = "fastapi-sample"
      image     = "fastapi_sample"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 8000
        }
      ]
    }
  ])
}