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
vnet = {
  vnet_name = "vnet-dev-infra"
  address_space = ["10.0.0.0/16"]
}

storage_account = {
  storage_account_name = "storageacc070826"
  container_access_type = "LRS"
  account_tier = "Standard"
}

storage_container = {
  container_name = "Images"
  container_access_type = "private"
}
