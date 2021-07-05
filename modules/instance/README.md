<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Service instance name | `string` | n/a | yes |
| <a name="input_service_id"></a> [service\_id](#input\_service\_id) | Cloudmap Service Id to register instance | `string` | n/a | yes |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Map of attributes (k/v) to assign to instance | `map(any)` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->