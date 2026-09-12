variable "prefix" {
  type        = string
  description = "Resource Prefix"
}

variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "random_suffix" {
  type        = string
  default     = "001"
  description = "Random suffix for globally unique Key Vault name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
