// Variables - General

variable "region" {
  default = "eu-west-1"
}

variable "prefix" {
  default = "xops"
}

variable "project" {
  default = "cloudmap"
}

variable "account_id" {
  default = "240442524813"
}

variable "tfm_x_acc_role_name" {
  default = "xops-tfm-adm-x-acc-role"
}
variable "tfm_x_acc_role_name_suffix" {}

// Variables - Cloudmap
// Add services to the end of the list - do not resort.
variable "services_ns" {
  type = list(string)
  default = [
    "payments-instant",
    "sentinel-screenings"
  ]
}

// New clients and accounts can be added in any order
variable "client_map" {
  type = map(any)
  default = {
    ohp = {
      dev = {
        ns = ["612859756521", "419040100698"]
      }
      int = {
        ns = ["537813884431"]
      }
    }

  }
}


