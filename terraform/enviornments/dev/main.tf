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

module "storage_account" {
  source   = "../../modules/storage_account"
  for_each = var.storage_account
  storage_account_name = each.value.storage_account_name
  container_name       = each.value.container_name
  container_access_type = each.value.container_access_type
  replication_type     = each.value.replication_type
  account_tier         = each.value.account_tier
  location             = azurerm_resource_group.this[each.key].location
  rg_name              = azurerm_resource_group.this[each.key].name
}