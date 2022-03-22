locals {
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  vpn_gateway_name = coalesce(var.custom_vpn_gateway_name, azurecaf_name.azure_vpngw_caf.result)
}
