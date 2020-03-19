variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "vnet" {
  default = {
    name          = "Sandbox"
    address_space = ["10.0.0.0/24"]
  }
}

variable "subnet" {
  default = [{
    address_prefix = "10.0.0.0/27"
    name           = "default"
  }]
}

variable "location" {
  type        = string
  description = ""
  default     = "uksouth"
}

variable "resource_group" {
  type        = string
  description = ""
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


variable "nsg_name" {
  type    = string
  default = "myfirstnsg"
}
