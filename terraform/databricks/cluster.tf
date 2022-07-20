data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  depends_on        = [azurerm_databricks_workspace.db_workspace]
}

data "databricks_clusters" "all" {
}

resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "${var.prefix}-cluster"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 5
  }
  spark_conf = {
    "spark.databricks.io.cache.enabled" : true,
    "spark.databricks.io.cache.maxDiskUsage" : "50g",
    "spark.databricks.io.cache.maxMetaDataCache" : "1g"
  }

  depends_on = [
    azurerm_databricks_workspace.db_workspace
  ]

}