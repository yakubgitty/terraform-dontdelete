terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}
terraform {
  backend "azurerm" {
/*     resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate" */
  }
}
provider "azurerm" {
  # Configuration options
  features {}
/*   subscription_id = "c6b3494e-5f7c-4336-9ff6-16978f844f83"
  client_id       = "f4a4b4cc-102d-4827-86f6-9b3f5fc080d1"
  client_secret   = "ytS8Q~CyC6_bbLzT7Xw.Y6QxcqPAwIZGycsYLcNw"
  tenant_id       = "f96fe015-6d5f-4536-a865-48dc3befedce" */
}

resource "azurerm_resource_group" "example19juneblock" {
  name     = "resgrp19jun_tf"
  location = "West Europe"
}

module "sa" {
  source = "./module/sa"
  resource_group_name = azurerm_resource_group.example19juneblock.name
  location = azurerm_resource_group.example19juneblock.location
  storage_account_name = "storac19june"
}
module "sa2" {
  source = "./module/sa"
  resource_group_name = azurerm_resource_group.example19juneblock.name
  location = azurerm_resource_group.example19juneblock.location
  storage_account_name = "storac19june2"
}