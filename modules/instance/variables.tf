variable "name" {
  type        = string
  description = "Service instance name"
}

variable "service_id" {
  type        = string
  description = "Cloudmap Service Id to register instance"
}

variable "attributes" {
  type        = map(any)
  description = "Map of attributes (k/v) to assign to instance"
  default     = null
}
