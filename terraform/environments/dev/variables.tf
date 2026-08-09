variable "rg" {
  type = map(object({
    rg_name  = string
    location = string
  }))

}
variable "keyvault" {
  type = map(object({
    key_vault_name =  string
    sku_name           = string
    key_permissions    = list(string)
    secret_permissions = list(string)
    rg_key             = string
  }))
}
variable "vnet" {
  type = map(object({
    vnet_name     = string
    address_space = list(string)
    rg_key        = string
  }))
}

variable "storage_account" {
  type = map(object({
    storage_account_name  = string
    container_access_type = string
    replication_type      = string
    account_tier          = string
    container_name        = string
    rg_key                = string
  }))
}
