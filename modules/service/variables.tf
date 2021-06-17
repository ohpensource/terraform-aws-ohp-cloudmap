variable "services" {
  type        = list(string)
  description = "List of services. Use descriptive name. No duplicates"
  default     = ["webportal", "api"]
}
variable "namespace_id" {
  type        = string
  description = "Cloudmap namespace id"
}
variable "namespace_arn" {
  type        = string
  description = "Cloudmap namespace arn"
}
variable "tags" {
  type        = map(any)
  description = "Tags to be applied"
  default     = {}
}
variable "dtap" {
  type        = string
  description = "Environment short name - dev, tst, acc, prd"
  default     = "dev"
}
variable "project" {
  type        = string
  description = "Project name"
  default     = "cloudmap"
}
variable "prefix" {
  type        = string
  description = "(Optional) Prefix for IAM role names"
  default     = null
}
variable "account_ids" { type = list(string) }
variable "platform" {
  type        = string
  description = "One of ns, ofs, cls"
}
variable "client" {
  type        = string
  description = "Client shortname - agn, rbc, tkp, etc"
  default     = "ohp"
}
