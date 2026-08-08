variable "rg" {
  type = map(object({
    rg_name = string
    location = string
  }))

}
variable "vnet" {
  type = map(object({
    vnet_name = string
    address_space = list(string)
  }))
}

variable "storage_account" {
  type = map(object({
    storage_account_name = string
    container_access_type = string
    account_tier = string
  }))
}

variable "storage_container" {
  type = map(object({
    container_name = string
    container_access_type = string
  }))
}