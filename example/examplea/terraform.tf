terraform {
  required_providers {
    azurerm = {
      version = "2.51.0"
      source  = "hashicorp/azurerm"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

  }
  required_version = ">= 0.14"
}
