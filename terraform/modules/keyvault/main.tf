resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id

  sku_name = var.sku_name

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions
  }
}