locals {
  globals = {
    long_name  = "amphorae"
    short_name = "amp"
  }

  azure = {
    location = "centralus"
  }

  github = {
    organization = "amphorae"
  }

  environments = "${merge(local.globals, local.azure, local.github)}"
}
