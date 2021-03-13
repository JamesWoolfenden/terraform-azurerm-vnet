common_tags = {
  "createdby" = "Terraform"
}
subnets = [{
  address_prefix = "10.0.0.0/27"
  name           = "web"
  },
  {
    address_prefix = "10.0.0.32/27"
    name           = "app"
  },
  {
    address_prefix = "10.0.0.64/27"
    name           = "data"
  }
]

rules = [{
  name                       = "test123"
  priority                   = 1000
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  },
  {
    name                       = "test1234"
    priority                   = 1100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}]
