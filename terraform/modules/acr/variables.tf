variable "prefix" {
  type        = string
  description = "Resource prefix (alphanumeric)"
}

variable "environment" {
  type        = string
  description = "Environment (dev, staging, prod)"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "ACR SKU (Basic, Standard, Premium)"
}

variable "random_suffix" {
  type        = string
  default     = "001"
  description = "Random suffix for unique ACR name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
