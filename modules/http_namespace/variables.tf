variable "envs" { type = list(string) }
variable "prefix" {}
variable "platform" {}
variable "services" { type = list(string) }
variable "default_tags" { type = map(any) }
variable "client" {}
variable "project" {}
variable "client_map" { type = map(any) }
variable "hierarchy_namespaces_service_id" {}
variable "hierarchy_services_service_id" {}
