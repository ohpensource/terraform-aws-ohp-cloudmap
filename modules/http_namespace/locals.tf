locals {
  namespace_name = "${var.client}${var.envs[count.index]}-${var.platform}"
}
