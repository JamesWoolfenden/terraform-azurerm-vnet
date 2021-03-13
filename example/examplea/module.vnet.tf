module "vnet" {
  source         = "../../"
  resource_group = azurerm_resource_group.vnet
  common_tags    = var.common_tags
  vnet           = var.vnet
  subnets        = var.subnets
  rules          = var.rules
}
