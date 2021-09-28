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