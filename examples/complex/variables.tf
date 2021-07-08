variable "services_ns" {
  type = list(string)
  default = [
    "parties",
    "bulk",
    "refmapper", "aaaaa"
  ]
}

variable "services_ofs" {
  type = list(string)
  default = [
    "qna-core",
    "sts-core",
    "ord",
  ]
}

variable "services_cls" {
  type = list(string)
  default = [
    "elvis",
    "backoffice",
    "midoffice"
  ]
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
