variable "services" {
  type        = list(any)
  description = "List of service names. Use descriptive name"
  default     = []
}

variable "namespace_id" {
  type        = string
  description = "Cloudmap namespace id"
}

variable "namespace_name" {
  type        = string
  description = "Cloudmap namespace name"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be applied"
  default     = {}
}

variable "create_service_iam_role" {
  type        = bool
  description = "Optional - create IAM role for updating services"
  default     = false
}

variable "account_ids" {
  type        = list(string)
  description = "List of account IDs that should be able to update cloudmap services"
  default     = []
}

variable "namespace_role_name" {
  type        = string
  description = "Optional - adds policy a policy to namespace role allowing update/modify of services"
  default     = null
}
