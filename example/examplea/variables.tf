variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}


variable "vnet" {
  default = {
    name          = "examplea"
    address_space = ["10.0.0.0/24"]
  }
}


variable "names" {
  type = list(string)
}

variable "address_prefixes" {
  type = list(string)
}

variable "rules" {
  description = "Rules for NSG"
  type = list(object({
    name                       = string,
    priority                   = number
    direction                  = string,
    access                     = string,
    protocol                   = string,
    source_port_range          = string,
    destination_port_range     = string,
    source_address_prefix      = string,
    destination_address_prefix = string
  }))
}
