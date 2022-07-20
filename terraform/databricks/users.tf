resource "databricks_group" "administrators" {
  display_name               = "Databricks Administrators"
  allow_cluster_create       = true
  allow_instance_pool_create = true
}

resource "databricks_user" "this" {
  user_name = var.admin_user
}

resource "databricks_group_member" "admin_membership" {
  group_id  = databricks_group.administrators.id
  member_id = databricks_user.this.id
}
