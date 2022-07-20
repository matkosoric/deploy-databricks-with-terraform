locals {
  prefix = lookup(local.tags, "Project", "")
  tags   = {
    Project     = "deploy-databricks"
    Environment = "Production"
    Author      = "Matko Soric"
    AuthorMail  = "soric.matko@gmail.com"
  }
}