module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.rg
  rg_name  = each.value.rg_name
  location = each.value.location
}

module "keyvault" {
  source             = "../../modules/keyvault"
  for_each           = var.keyvault
  key_vault_name     = each.value.key_vault_name
  location           = module.resource_group[each.value.rg_key].location
  rg_name            = module.resource_group[each.value.rg_key].rg_name
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = data.azurerm_client_config.current.object_id
  sku_name           = each.value.sku_name
  key_permissions    = each.value.key_permissions
  secret_permissions = each.value.secret_permissions
}

module "vnet" {
  source        = "../../modules/vnet"
  for_each      = var.vnet
  vnet_name     = each.value.vnet_name
  address_space = each.value.address_space
  location      = module.resource_group[each.value.rg_key].location
  rg_name       = module.resource_group[each.value.rg_key].rg_name
}

module "storage_account" {
  source                = "../../modules/storage_account"
  for_each              = var.storage_account
  storage_account_name  = each.value.storage_account_name
  container_name        = each.value.container_name
  container_access_type = each.value.container_access_type
  replication_type      = each.value.replication_type
  account_tier          = each.value.account_tier
  location              = module.resource_group[each.value.rg_key].location
  rg_name               = module.resource_group[each.value.rg_key].rg_name
}
