terraform {
  required_providers {
    azurerm = {
      version = "2.65.0"
      source  = "hashicorp/azurerm"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
  required_version = ">=0.14.8"
}
