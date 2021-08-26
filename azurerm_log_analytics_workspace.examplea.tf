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
  # checkov:skip=CKV2_AZURE_8: TODO
  # checkov:skip=CKV2_AZURE_18: TODO
  # checkov:skip=CKV2_AZURE_1: TODO
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

resource "azurerm_storage_account_customer_managed_key" "example" {
  storage_account_id = azurerm_storage_account.example.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
}

resource "azurerm_key_vault" "example" {
  name                = "examplekv"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }
}


resource "azurerm_key_vault_access_policy" "storage" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.example.identity.0.principal_id

  key_permissions    = ["get", "create", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["get", "create", "delete", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}


resource "azurerm_key_vault_key" "example" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA-HSM"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

  depends_on = [
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.storage,
  ]
  expiration_date = timeadd(timestamp(), "365d")
}

data "azurerm_client_config" "current" {}
