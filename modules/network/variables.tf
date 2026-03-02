variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }

variable "app_subnet_cidr" { type = string }
variable "data_subnet_cidr" { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}