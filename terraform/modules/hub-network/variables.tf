variable "vnet_name" {}

variable "location" {}

variable "resource_group_name" {}

variable "address_space" {
  type = list(string)
}

variable "gateway_subnet" {}

variable "shared_services_subnet" {}

variable "tags" {
  type = map(string)
}