module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.rg
  rg_name     = each.value.rg_name
  location = each.value.location
}