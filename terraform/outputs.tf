output "fastapi_sample_task_definition_revision" {
  description = "The revision of the task"
  value       = aws_ecs_task_definition.fastapi_sample_task_definition.revision
}

output "fastapi_sample_svc_desired_count" {
  description = "The number of instances of the task definition"
  value       = aws_ecs_service.fastapi_sample_svc.desired_count
}
