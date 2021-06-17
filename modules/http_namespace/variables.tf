variable "envs" {
  type        = list(string)
  description = "List of environments"
  default     = ["acc", "tst", "prd"]
}
variable "platform" {
  type        = string
  description = "One of ns, ofs, cls"
}
variable "tags" {
  type        = map(any)
  description = "Tags to be applied"
  default     = {}
}
variable "client" {
  type        = string
  description = "Client shortname - agn, rbc, tkp, etc"
  default     = "ohp"
}
