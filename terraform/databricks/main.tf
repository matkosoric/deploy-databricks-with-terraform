
resource "azurerm_databricks_workspace" "db_workspace" {
  name                        = "${var.prefix}-workspace"
  resource_group_name         = var.resource_group
  location                    = var.region
  sku                         = "premium"
  managed_resource_group_name = "${var.prefix}-workspace-rg"
  tags                        = var.tags
}

