# Terraform Module - Cloudmap Service Discovery - HTTP Namespace

## Maintainer

* Platform Services

## Author

* Rupert Broad

## Description

Creates Cloudmap Namespaces

## Usage

See examples folder

## Documentation

[confluence](https://ohpendev.atlassian.net/wiki/spaces/CCE/pages/2062320795/Terraform+Modules)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_services"></a> [services](#module\_services) | ../service |  |

## Resources

| Name | Type |
|------|------|
| [aws_service_discovery_http_namespace.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_http_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client"></a> [client](#input\_client) | n/a | `any` | n/a | yes |
| <a name="input_client_map"></a> [client\_map](#input\_client\_map) | n/a | `map(any)` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_envs"></a> [envs](#input\_envs) | n/a | `list(string)` | n/a | yes |
| <a name="input_hierarchy_namespaces_service_id"></a> [hierarchy\_namespaces\_service\_id](#input\_hierarchy\_namespaces\_service\_id) | n/a | `any` | n/a | yes |
| <a name="input_hierarchy_services_service_id"></a> [hierarchy\_services\_service\_id](#input\_hierarchy\_services\_service\_id) | n/a | `any` | n/a | yes |
| <a name="input_platform"></a> [platform](#input\_platform) | n/a | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `any` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | n/a | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->