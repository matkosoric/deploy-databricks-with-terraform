output "databricks_host" {
  value = "https://${azurerm_databricks_workspace.db_workspace.workspace_url}/"
}
