variable "services" { type = list(string) }
variable "namespace_id" {}
variable "namespace_arn" {}
variable "default_tags" { type = map(any) }
variable "dtap" {}
variable "project" {}
variable "platform" {}
variable "client" {}
variable "prefix" {}
variable "account_ids" { type = list(string) }
variable "hierarchy_services_service_id" {}
