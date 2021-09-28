variable "resource_group_name" {
  description = "Name of the RG that will contain related resources"
  type = string
}

variable "location" {
  description = "Location of the resources"
  type = string
}

variable "aci_name" {
  description = "Name of the Azure ACI"
  type = string
}

variable "ip_address_type" {
  description = "IP address type. Should be public or private"
  type = string
  default = "public"
}

variable "dns_name_label" {
  description = "DNS name for the ACI"
  type = string
}

variable "os_type" {
  description = "OS type of the ACI. Should be Linux or Windows"
  type = string
  default = "Linux"
}

variable "container_name" {
  description = "Name of the container inside the ACI"
  type = string
}

variable "container_image" {
  description = "Image of the container"
  type = string
}

variable "cpu" {
  description = "Total CPU for the container"
  type = string
  default = 1
}

variable "memory" {
  description = "Total Memory for the container"
  type = string
  default = 1
}

variable "container_ports" {
  description = "Exposed for for the container"
  type = any
  default = []
}

variable "restart_policy" {
  description = "Restart policy for the ACI. Should be Always, Never, OnFailure"
  type = string
  default = "Always"
}

variable "environment_variables" {
  description = "Environment vars for the container"
  type = map
  default = {}
}

variable "secure_environment_variables" {
  description = "Environment vars for the container"
  type = map
  default = {}
}

variable "storage_account_name" {
  description = "Storage account for fileshare volume"
  type = string
}

variable "account_tier" {
  description = "Storage account tier. Standard or Premium"
  type = string
  default = "Standard"
}

variable "account_kind" {
  description = "Storage account kind. BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type = string
  default = "StorageV2"
}

variable "account_replication_type" {
  description = "Replication type for storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  type = string
  default = "LRS"
}

variable "container_volume" {
  description = "Quota for webdata fileshare"
  type = any
  default = []
}