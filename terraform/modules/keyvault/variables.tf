variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "key_vault_name" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "object_id" {
  type = string
}
variable "key_permissions" {
  type = list(string)
}
variable "secret_permissions" {
  type = list(string)
}