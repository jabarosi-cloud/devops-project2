variable "resource_group_name" {
  type    = string
  default = "rg-devops-project2"
}

variable "location" {
  type    = string
  default = "northeurope"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}
