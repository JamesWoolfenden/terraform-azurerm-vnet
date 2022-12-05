
resource "azurerm_storage_account" "test" {
  # checkov:skip=CKV_AZURE_33: Queue not in use
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


  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_account_customer_managed_key" "example" {
  storage_account_id = azurerm_storage_account.test.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
}
