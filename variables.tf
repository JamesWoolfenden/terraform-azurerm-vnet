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
