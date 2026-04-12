terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_cidr           = "10.2.0.0/16"
  subnet_cidr         = "10.2.1.0/24"
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  vm_count            = 2
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = var.resource_group_name
  location            = var.location
  backend_nic_ids     = module.compute.nic_ids
  depends_on          = [module.network]
}