locals {
  namespace_prefix   = var.namespace_prefix == null ? "" : "${var.namespace_prefix}-"
  namespace_services = [{ for k, v in var.services : "${local.namespace_prefix}${k}" => "${var.services[k]}" }]
}

