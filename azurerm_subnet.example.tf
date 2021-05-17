
resource "azurerm_subnet" "example" {
  count                = length(var.names)
  name                 = var.names[count.index]
  resource_group_name  = var.resource_group.name
  virtual_network_name = azurerm_virtual_network.tfer.name
  address_prefixes     = [var.address_prefixes[count.index]]
}
