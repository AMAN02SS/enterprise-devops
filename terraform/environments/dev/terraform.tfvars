rg = {
  rg_dev = {
    rg_name  = "rg-dev-infra"
    location = "Central India"
  }
}

keyvault = {
  keyvault_dev = {
    key_vault_name     = "kv-dev-infra-090826"
    sku_name           = "standard"
    key_permissions    = ["Get"]
    secret_permissions = ["Get"]
    rg_key             = "rg_dev"
  }
}
vnet = {
  vnet_dev = {
    vnet_name     = "vnet-dev-infra"
    address_space = ["10.0.0.0/16"]
    rg_key        = "rg_dev"
  }
}

storage_account = {
  storage_account_dev = {
    storage_account_name  = "storageacc070826"
    replication_type      = "LRS"
    account_tier          = "Standard"
    container_name        = "images"
    container_access_type = "private"
    rg_key                = "rg_dev"
  }
}
