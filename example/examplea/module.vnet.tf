module "vnet" {
  source         = "../../"
  resource_group = azurerm_resource_group.vnet
  common_tags    = var.common_tags
  vnet           = var.vnet
  names        = var.names
  address_prefixes=var.address_prefixes
  rules          = var.rules
}
