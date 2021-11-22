locals {
  namespace_info_ohp = {

    dev = {
      account_ids = ["333946375643", "220865334071", "612859756521", "419040100698"]
      services = {
        ns  = var.services_ns
        ofs = var.services_ofs
        cls = ["backoffice"]
      }
      create_namespace_iam_role = true
      create_service_iam_role   = true
    },
    int = {
      account_ids = ["333946375643", "537813884431"]
      services = {
        ns  = var.services_ns
        ofs = var.services_ofs
        cls = var.services_cls
      }
    }
  }

  namespace_info_tkp = {
    tst = {
      account_ids = ["687415809392", "828323158302"]
      services = {
        ns  = []
        ofs = []
        cls = []
      }
    },
    acc = {
      account_ids = ["807823966805", "197082791059"]
      services = {
        ns  = []
        ofs = []
        cls = []
      }
    }
  }
}
