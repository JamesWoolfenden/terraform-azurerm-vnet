terraform {
  required_providers {
    azurerm = {
      version = "3.34.0"
      source  = "hashicorp/azurerm"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
  required_version = ">= 1.3.0"
}
