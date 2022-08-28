resource "aws_iam_role" "fastapi_sample_svc_role" {
  name = "fastapi-sample-svc-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    name = "fastapi-sample-svc-role"
  }
}