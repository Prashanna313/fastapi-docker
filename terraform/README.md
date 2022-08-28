<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.fastapi_sample_svc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.fastapi_sample_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.fastapi_sample_svc_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_ecs_cluster.prashanna_ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | (Required) The account in which the resources needs to be deployed | `string` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | (optional) The app in which the resources are associated, by default app-A | `string` | `"fastapi-sample"` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | (optional) The CostCenter in which the resources needs to be tagged, by default division-A | `string` | `"Prashanna"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (optional) The Environment in which the resources needs to be deployed, by default dev | `string` | `"dev"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | (optional) The owner of the resources that are created, by default team-A | `string` | `"Prashanna"` | no |
| <a name="input_region"></a> [region](#input\_region) | (Required) The AWS region in which the resources needs to be deployed | `string` | n/a | yes |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | (Required) The S3 bucket in which state file is stored | `string` | n/a | yes |
| <a name="input_state_object_key"></a> [state\_object\_key](#input\_state\_object\_key) | (Required) The S3 object key in which state file is stored | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fastapi_sample_svc_desired_count"></a> [fastapi\_sample\_svc\_desired\_count](#output\_fastapi\_sample\_svc\_desired\_count) | The number of instances of the task definition |
| <a name="output_fastapi_sample_task_definition_revision"></a> [fastapi\_sample\_task\_definition\_revision](#output\_fastapi\_sample\_task\_definition\_revision) | The revision of the task |
<!-- END_TF_DOCS -->