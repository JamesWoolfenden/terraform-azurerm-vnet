resource "azurerm_log_analytics_workspace" "examplea" {
  name                = var.watcher
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = "PerGB2018"
}

resource "azurerm_network_watcher" "test" {
  name                = var.watcher
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
}

resource "azurerm_storage_account" "test" {
  name                = var.watcher
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  network_rules {
    default_action = "Deny"
  }

  min_tls_version           = "TLS1_2"
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}

variable "watcher" {
  type        = string
  description = "Watcher group name"
  default     = "acctest"
}
