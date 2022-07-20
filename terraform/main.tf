module "databricks" {
  source         = "./databricks"
  region         = var.region
  resource_group = var.resource_group

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  prefix          = local.prefix
  tags            = local.tags
  admin_user      = var.admin_user
}
