terraform {

  required_version = ">=1.1.9"

  required_providers {

    databricks = {
      source  = "databricks/databricks"
      version = "0.5.5"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.13.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.resource_group
    storage_account_name = var.storage_account
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}