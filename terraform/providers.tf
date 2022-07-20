# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = "true"
  client_id                  = var.client_id
  client_secret              = var.client_secret
  tenant_id                  = var.tenant_id
  subscription_id            = var.subscription_id
  features {}
}
