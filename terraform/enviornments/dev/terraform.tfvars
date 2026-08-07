rg = {
  rg_name  = "rg-dev-infra"
  location = "Central India"
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