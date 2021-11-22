variable "account_ids" {
  type        = list(string)
  description = "List of account IDs that should be able to access cloudmap namespaces"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be applied"
  default     = {}
}

variable "name" {
  type        = string
  description = "Cloudmap IAM read-only role name"
  default     = "cloudmap-disco"
}
