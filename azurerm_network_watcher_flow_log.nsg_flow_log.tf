
resource "azurerm_network_watcher_flow_log" "nsg_flow_log" {
  network_watcher_name      = azurerm_network_watcher.test.name
  resource_group_name       = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.examplea.id
  storage_account_id        = azurerm_storage_account.test.id
  enabled                   = true
  version                   = 2
  name                      = azurerm_network_watcher.test.name
  retention_policy {
    enabled = true
    days    = 90
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.examplea.workspace_id
    workspace_region      = azurerm_log_analytics_workspace.examplea.location
    workspace_resource_id = azurerm_log_analytics_workspace.examplea.id
    interval_in_minutes   = 10
  }
}
