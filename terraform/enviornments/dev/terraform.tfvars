rg = {
  rg_name  = "rg-dev-infra"
  location = "Central India"
}

keyvault = {
  key_vault_name     = "kv-dev-infra"
  rg_name            = "rg-dev-infra"
  location           = "Central India"
  sku_name           = "standard"
  key_permissions    = "Get"
  secret_permissions = "Get"
}
