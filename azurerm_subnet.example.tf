
resource "azurerm_subnet" "example" {
  count                = length(var.subnet)
  name                 = var.subnet[count.index]["name"]
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.tfer.name
  address_prefixes     = var.subnet[count.index]["address_prefixes"]
}
