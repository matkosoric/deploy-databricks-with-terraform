# Deploy Databricks on Azure with Terraform - minimal setup

This is a minimal example for deploying Databricks service on Azure.
The smallest number of nodes in the cluster will be 1, and maximum 5.
Node type will be the smallest one, and Spark version the latest one with long term support.
You will be able to log in automatically with your SSO user.
Auto-termination is set to 20 minutes.

Several manual steps are necessary to configure Terraform with Azure Service Principal.

1. Create resource group **DEPLOY_DATABRICKS**
2. Create storage account for terraform state **deploydatabricks**
3. Create container in storage account **deploy-databricks-terraform-state**
4. Create Service Principal that will be used for Terraform operations 

```
   az ad sp create-for-rbac --name "http://deploy-databricks-service-principal.<YOUR_DOMAIN>.onmicrosoft.com" --role contributor \
   --scopes /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP> \
   --sdk-auth
```

5. Allow Contributor access to Service Principal for the resource group
6. Allow Contributor access to Service Principal for storage account
7. Create environment CLEAN_UP, and add yourself as reviewer to have manual approval for decommissioning resources   
8. Save authentication credentials in GitHub secrets,
   along with tenant ID and administrator mail that will enable you to log in automatically:

   * SERVICE_PRINCIPAL_ID
   * SERVICE_PRINCIPAL_SECRET
   * SUBSCRIPTION_ID
   * TENANT_ID
   * ADMIN_USER_MAIL

   
[Official documentation for configuring Service Principal on Azure for Terraform](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/service_principal_client_secret)


### Created With:

* [Terraform](https://www.terraform.io/) - Infrastructure automation tool
* [Databricks](https://databricks.com/) - Web-based processing platform for Spark 
* [GitHub Actions](https://docs.github.com/en/actions) - CICD tool
* [Azure](https://portal.azure.com/) - Cloud computing service owned by Microsoft


### Screenshots

1. Databricks GUI  
![Databricks GUI](https://raw.githubusercontent.com/matkosoric/deploy-databricks-with-terraform/main/docs/databricks-gui.PNG?raw=true "")

2. Databricks workspace tags  
![Databricks tags](https://raw.githubusercontent.com/matkosoric/deploy-databricks-with-terraform/main/docs/databricks-tags.PNG?raw=true "")
   
3. GitHub secrets  
![GitHub secrets](https://raw.githubusercontent.com/matkosoric/deploy-databricks-with-terraform/main/docs/github-secrets.PNG?raw=true "")

4. Manual approval setup  
![Manual approval](https://raw.githubusercontent.com/matkosoric/deploy-databricks-with-terraform/main/docs/manual_approval.PNG?raw=true "")

5. Provisioning and decommissioning jobs  
![GitHub jobs](https://raw.githubusercontent.com/matkosoric/deploy-databricks-with-terraform/main/docs/github-jobs.PNG?raw=true "")
