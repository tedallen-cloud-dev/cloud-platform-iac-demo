locals {
  tags = {
    owner      = var.owner
    env        = var.env
    app        = var.app
    costcenter = var.costcenter
  }
}

module "rg" {
  source   = "../../modules/rg"
  name     = "rg-${var.app}-${var.env}"
  location = var.location
  tags     = local.tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = module.rg.name
  location            = module.rg.location

  vnet_name        = "vnet-${var.app}-${var.env}"
  address_space    = var.address_space
  app_subnet_cidr  = var.app_subnet_cidr
  data_subnet_cidr = var.data_subnet_cidr

  tags = local.tags
}