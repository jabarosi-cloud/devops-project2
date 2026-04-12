terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatejabarosi"
    container_name       = "tfstate"
    key                  = "devops-project2.tfstate"
  }
}