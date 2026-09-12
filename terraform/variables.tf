variable "prefix" {
  type        = string
  default     = "cloudops"
  description = "Resource prefix for Azure infrastructure"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment identifier (dev, staging, prod)"
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "Azure Region for deployment"
}

variable "tags" {
  type        = map(string)
  default = {
    Project     = "AzureDevOpsEnterprisePlatform"
    ManagedBy   = "Terraform"
    Environment = "dev"
    Owner       = "DevOpsTeam"
  }
  description = "Global tags applied to all Azure resources"
}
