variable "rg" {
  type = map(object({
    rg_name  = string
    location = string
  }))

}
variable "keyvault" {
  type = map(object({
    sku_name           = string
    rg_name            = string
    location           = string
    key_permissions    = list(string)
    secret_permissions = list(string)
  }))
}
