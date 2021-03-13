
resource "azurerm_network_watcher_flow_log" "nsg_flow_log" {
  for_each                  = var.subnets
  network_watcher_name      = var.network_watcher_name
  resource_group_name       = var.network_watcher_resource_group_name
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  storage_account_id        = var.log_analytics_storage_account_id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = true
    days    = 30
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = var.log_analytics_workspace_id
    workspace_region      = local.location
    workspace_resource_id = var.log_analytics_workspace_resource_id
    interval_in_minutes   = 10
  }
}
