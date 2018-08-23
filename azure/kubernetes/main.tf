module "config" {
  source = "../../config"
}

locals {
  environment = "${module.config.environments}"
}
