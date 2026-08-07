module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.rg
  rg_name     = each.value.rg_name
  location = each.value.location
}

module "keyvault" {
  source   = "../../modules/keyvault"
  for_each = var.keyvault
  key_vault_name     = each.value.key_vault_name
  location = each.value.location
  rg_name = module.resource_group[each.value.rg_name].azurerm_resource_group.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  sku_name = each.value.sku_name
  key_permissions = each.value.key_permissions
  secret_permissions = each.value.secret_permissions
}