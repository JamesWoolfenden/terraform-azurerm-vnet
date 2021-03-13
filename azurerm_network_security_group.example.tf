resource "azurerm_network_security_group" "examplea" {
  name                = var.nsg_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name


  dynamic "security_rule" {
    for_each = var.rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags = var.common_tags

}
