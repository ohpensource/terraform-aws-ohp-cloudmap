variable "namespace_name" {
  type    = string
  default = "example"
}

variable "namespace_description" {
  type    = string
  default = "example namespace"
}

variable "create_namespace_iam_role" {
  type    = bool
  default = true
}

variable "create_service_iam_role" {
  type    = bool
  default = true
}

variable "account_ids" {
  type    = list(string)
  default = ["669720269214", "333946375643"]
}

variable "services" {
  type    = list(string)
  default = ["funds", "accounts"]
}

variable "instance_name" {
  type    = string
  default = "example"
}

variable "instance_attributes" {
  type = map(any)
  default = {
    version = "1.0"
    url     = "https://test.example.com"
  }
}

variable "tags" {
  type = map(any)
  default = {
    Iac          = "terraform"
    IacRepo      = "https://bitbucket.org/ohpen-dev/xops-tfm-shd-cloudmap"
    Team         = "pst"
    Stage        = "dev"
    Client       = "ohp"
    Service      = "cloudmap"
    ServiceGroup = "platform"
  }
}
