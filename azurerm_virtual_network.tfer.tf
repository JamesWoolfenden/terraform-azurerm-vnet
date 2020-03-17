resource "azurerm_virtual_network" "tfer" {
  address_space       = var.vnet["address_space"]
  location            = var.location
  name                = var.vnet["name"]
  resource_group_name = var.resource_group

  subnet {
    address_prefix = var.subnet["address_prefix"]
    name           = var.subnet["name"]
  }

  tags = var.common_tags
}
