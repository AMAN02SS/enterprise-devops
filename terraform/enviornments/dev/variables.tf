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