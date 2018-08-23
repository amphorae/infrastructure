resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes-${local.environment["long_name"]}"
  location = "${local.environment["location"]}"
}

resource "azurerm_azuread_application" "kubernetes" {
  name = "kubernetes"
}

resource "azurerm_azuread_service_principal" "kubernetes" {
  application_id = "${azurerm_azuread_application.kubernetes.application_id}"
}

resource "azurerm_azuread_service_principal_password" "kubernetes" {
  service_principal_id = "${azurerm_azuread_service_principal.kubernetes.id}"
  value                = "${var.sp_password}"
  end_date             = "2020-01-01T00:00:00Z"
}

resource "azurerm_role_assignment" "kubernetes" {
  scope                = "${azurerm_resource_group.kubernetes.id}"
  role_definition_name = "Owner"
  principal_id         = "${azurerm_azuread_service_principal.kubernetes.id}"
}

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "kubernetes-${local.environment["long_name"]}"
  location            = "${local.environment["location"]}"
  resource_group_name = "${azurerm_resource_group.kubernetes.name}"
  dns_prefix          = "kubernetes${local.environment["long_name"]}"

  linux_profile {
    admin_username = "amphorae"

    ssh_key {
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDg7h0ta0dZ1/QEaPQiX2uNnmlpKLiOCuBS0YSnbevPiNbR18o2yjFFiv9gezpXdbryHBe8AQ21MQ2n6Aef+8dU3zR4jaPWrC+3NdZSrwHQkAcAfIqMOBlLmjHmgmxSYeI5HAY82KEh0qL9WnNELwBxmki47AN8vTuwttWaDt9AtIzt+1E9/UILr7264nHkC5O9pF8jVw6jL9HKXjKu1HqdHI6ghbwx7gX3omJP0dWjj3oRoUZJT/BpMpURs+h5cOoDw5CdKmPO0ZjW/gribrrnSjje3pP1gL0DXGO9nkYfBUSOps7GnPYk4xW4GYcoqY2+iyge9Ri6c6ZFkCDkoOPx"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${azurerm_azuread_application.kubernetes.application_id}"
    client_secret = "${var.sp_password}"
  }
}
