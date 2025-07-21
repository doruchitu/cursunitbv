locals {
    prefix = "cursUnitBv"
}

# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

variable client_secret {
    type = string
    sensitive = true
}

variable client_id {
    type = string
    sensitive = true
}

variable tenant_id {
    type = string
    sensitive = true
}

variable subscription_id {
    type = string
    sensitive = true
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg"
  location = "West Europe"
}