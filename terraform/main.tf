# Root Terraform Configuration

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg-${var.environment}"
  location = var.location
  tags     = var.tags
}

module "networking" {
  source              = "./modules/networking"
  prefix              = var.prefix
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

module "keyvault" {
  source              = "./modules/keyvault"
  prefix              = var.prefix
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  random_suffix       = random_string.suffix.result
  tags                = var.tags
}

module "acr" {
  source              = "./modules/acr"
  prefix              = var.prefix
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  random_suffix       = random_string.suffix.result
  tags                = var.tags
}

module "aks" {
  source              = "./modules/aks"
  prefix              = var.prefix
  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.networking.aks_subnet_id
  acr_id              = module.acr.acr_id
  tags                = var.tags
}
