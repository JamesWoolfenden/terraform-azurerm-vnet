resource "azurerm_log_analytics_workspace" "examplea" {
  name                = var.watcher
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = "PerGB2018"
}

storage_account_id = azurerm_storage_account.example.id
object_id          = azurerm_storage_account.example.identity.0.principal_id
data "azurerm_client_config" "current" {}
