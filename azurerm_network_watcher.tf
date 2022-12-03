resource "azurerm_network_watcher" "test" {
  name                = var.watcher
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
}

