resource "azurerm_virtual_network" "tfer" {
  address_space       = var.vnet["address_space"]
  location            = var.resource_group.location
  name                = var.vnet["name"]
  resource_group_name = var.resource_group.name
  tags                = var.common_tags
}
