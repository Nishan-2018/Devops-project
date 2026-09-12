# Azure Storage Account Remote Backend State Configuration

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "cloudopstfstate001"
    container_name       = "tfstate"
    key                  = "devops-platform.dev.tfstate"
  }
}
