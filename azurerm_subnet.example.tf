
resource "azurerm_subnet" "example" {
  count                = length(var.subnets)
  name                 = var.subnets[count.index]["name"]
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.tfer.name
  address_prefixes     = var.subnets[count.index]["address_prefixes"]
}
