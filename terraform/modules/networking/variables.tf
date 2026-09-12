variable "prefix" {
  type        = string
  description = "Resource prefix for naming convention"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "vnet_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for VNet"
}

variable "aks_subnet_cidr" {
  type        = string
  default     = "10.0.0.0/22"
  description = "CIDR block for AKS Node Pool subnet"
}

variable "pe_subnet_cidr" {
  type        = string
  default     = "10.0.8.0/24"
  description = "CIDR block for Private Endpoints subnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
