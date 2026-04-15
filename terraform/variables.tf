variable "rg_name" {
  description = "name of the resource_group"
  type        = string

}

variable "location" {
  description = "location of the resource"
  type        = string
}

variable "aks_name" {
  description = "name of the aks cluster"
  type        = string

}

variable "node_count" {
  description = "number of nodes"
  type        = number
  default     = 1

}

variable "vm_size" {
  description = "size of the node"
  type        = string
  default     = "Standard_D2pls_v6"
}

variable "acrname" {
  description = "azure container registry name"
  type        = string

}

variable "acr_rg_name" {
  description = "acr resource_group name"
  type        = string

}
