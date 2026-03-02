variable "location" { type = string }
variable "env" { type = string }
variable "app" { type = string }
variable "owner" { type = string }
variable "costcenter" { type = string }

variable "address_space" { type = list(string) }
variable "app_subnet_cidr" { type = string }
variable "data_subnet_cidr" { type = string }