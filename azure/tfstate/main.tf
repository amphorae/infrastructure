module "config" {
  source = "../../config"
}

locals {
  environment = "${module.config.environments}"
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate-${local.environment["long_name"]}"
  location = "${local.environment["location"]}"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${local.environment["short_name"]}"
  resource_group_name      = "${azurerm_resource_group.tfstate.name}"
  location                 = "${local.environment["location"]}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  resource_group_name   = "${azurerm_resource_group.tfstate.name}"
  storage_account_name  = "${azurerm_storage_account.tfstate.name}"
  container_access_type = "private"
}
