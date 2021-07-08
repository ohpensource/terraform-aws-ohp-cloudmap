# Terraform Module - Cloudmap Service Discovery - Services

## Maintainer

* Platform Services

## Author

* Rupert Broad

## Description

Creates Cloudmap Services and optinally a read-write IAM role for updating service instances and attributes.

## Usage

See examples folder

## Documentation

[confluence](https://ohpendev.atlassian.net/wiki/spaces/CCE/pages/2062320795/Terraform+Modules)

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
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.namespace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_service_discovery_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |
| [aws_ssm_parameter.service_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.rw_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | Cloudmap namespace id | `string` | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Cloudmap namespace name | `string` | n/a | yes |
| <a name="input_account_ids"></a> [account\_ids](#input\_account\_ids) | List of account IDs that should be able to update cloudmap services | `list(string)` | `[]` | no |
| <a name="input_create_service_iam_role"></a> [create\_service\_iam\_role](#input\_create\_service\_iam\_role) | Optional - create IAM role for updating services | `bool` | `false` | no |
| <a name="input_namespace_role_name"></a> [namespace\_role\_name](#input\_namespace\_role\_name) | Optional - adds policy a policy to namespace role allowing update/modify of services | `string` | `null` | no |
| <a name="input_services"></a> [services](#input\_services) | List of service names. Use descriptive name | `list(any)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->