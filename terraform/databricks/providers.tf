provider "databricks" {
  host                        = "https://${azurerm_databricks_workspace.db_workspace.workspace_url}/"
  azure_workspace_resource_id = azurerm_databricks_workspace.db_workspace.id
  azure_use_msi               = true

  azure_client_id     = var.client_id
  azure_client_secret = var.client_secret
  azure_tenant_id     = var.tenant_id
}
