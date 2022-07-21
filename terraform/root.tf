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
    resource_group_name  = "DEPLOY_DATABRICKS"
    storage_account_name = "deploydatabricks"
    container_name       = "deploy-databricks-terraform-state"
    key                  = "terraform.tfstate"
  }

}