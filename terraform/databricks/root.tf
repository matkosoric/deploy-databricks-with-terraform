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

}