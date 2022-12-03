resource "azurerm_log_analytics_workspace" "examplea" {
  name                = var.watcher
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = "PerGB2018"
}

data "azurerm_client_config" "current" {}
