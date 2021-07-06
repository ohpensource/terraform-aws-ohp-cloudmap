variable "tags" {
  type        = map(any)
  description = "(Required) Map of tags to apply to repository"
  default     = {}
}

variable "name" {
  type        = string
  description = "Client environment platform e.g. tkptst-ofs"
}

variable "description" {
  type        = string
  description = "Namespace description e.g. TKP TST OFS"
  default     = "Namespace"
}

variable "account_ids" {
  type        = list(string)
  description = "List of account IDs that should be able to update cloudmap namespaces"
  default     = []
}

variable "create_iam_rw_role" {
  type        = bool
  description = "Create Namespace read-write role"
  default     = false
}

