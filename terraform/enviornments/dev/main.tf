module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.rg
  rg_name     = each.value.rg_name
  location = each.value.location
}

module "vnet" {
  source   = "../../modules/vnet"
  for_each = var.vnet
  vnet_name     = each.value.vnet_name
  address_space = each.value.address_space
  location      = azurerm_resource_group.this[each.key].location
  rg_name       = azurerm_resource_group.this[each.key].name
}