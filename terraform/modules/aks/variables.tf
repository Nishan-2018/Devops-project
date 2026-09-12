variable "prefix" {
  type        = string
  description = "Resource prefix"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "subnet_id" {
  type        = string
  description = "VNet Subnet ID for AKS"
}

variable "acr_id" {
  type        = string
  description = "Azure Container Registry ID for AcrPull binding"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.29.2"
  description = "Kubernetes Version"
}

variable "system_node_count" {
  type        = number
  default     = 2
  description = "Initial System Node Pool Count"
}

variable "system_vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "System VM Size"
}

variable "enable_spot_pool" {
  type        = bool
  default     = true
  description = "Enable Spot user node pool for FinOps cost reduction"
}

variable "user_vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "User VM Size"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
