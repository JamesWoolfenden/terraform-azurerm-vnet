module "vnet" {
  source         = "../../"
  resource_group = var.resource_group
  common_tags    = var.common_tags
  vnet           = var.vnet
  subnet         = var.subnet
}
