variable "client_name" {
  description = "Name of client."
  type        = string
}

variable "environment" {
  description = "Name of application's environment."
  type        = string
}

variable "stack" {
  description = "Name of application's stack."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application's resource group."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for generated resources names."
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Suffix for the generated resources names."
  type        = string
  default     = ""
}

variable "name_slug" {
  description = "Slug to use with the generated resources names."
  type        = string
  default     = ""
}

variable "extra_tags" {
  description = "Map of additional tags."
  type        = map(string)
  default     = {}
}

variable "logs_destinations_ids" {
  description = "List of destination resources IDs for logs diagnostic destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set."
  type        = list(string)
}
# Virtual Wan specific variables
variable "custom_vwan_name" {
  description = "Custom Virtual Wan's name."
  type        = string
  default     = null
}

variable "vpn_encryption_enabled" {
  description = "Boolean flag to specify whether VPN encryption is enabled"
  type        = bool
  default     = true
}

variable "branch_to_branch_traffic_allowed" {
  description = "Boolean flag to specify whether branch to branch traffic is allowed"
  type        = bool
  default     = true
}

variable "office365_local_breakout_category" {
  description = "Specifies the Office365 local breakout category. Possible values include: `Optimize`, `OptimizeAndAllow`, `All`, `None`"
  type        = string
  default     = "None"
}

variable "virtual_wan_type" {
  description = "Specifies the Virtual Wan type. Possible Values include: `Basic` and `Standard`"
  type        = string
  default     = "Standard"
}

variable "virtual_wan_extra_tags" {
  description = "Extra tags for this Virtual Wan"
  type        = map(string)
  default     = {}
}

# Virtual Hub specific variables
variable "custom_virtual_hub_name" {
  description = "Custom Virtual Hub's name"
  type        = string
  default     = null
}

variable "virtual_hub_address_prefix" {
  description = "The address prefix which should be used for this Virtual Hub. Cannot be smaller than a /24. A /23 is recommended by Azure"
  type        = string
  validation {
    condition     = tonumber(split("/", var.virtual_hub_address_prefix)[1]) <= 24
    error_message = "Virtual Hub address prefix must be at least /24. A /23 is recommended by Azure."
  }
}

variable "virtual_hub_sku" {
  description = "The SKU of the Virtual Hub. Possible values are `Basic` and `Standard`"
  type        = string
  default     = "Standard"
}

variable "virtual_hub_extra_tags" {
  description = "Extra tags for this Virtual Hub"
  type        = map(string)
  default     = {}
}

variable "virtual_hub_routes" {
  description = "List of route blocks. `next_hop_ip_address` values can be `azure_firewall` or an IP address."
  type = list(object({
    address_prefixes    = list(string),
    next_hop_ip_address = string
  }))
  default = []
}

# Express route variables
variable "express_route_enabled" {
  description = "Enable or not Express Route configuration"
  type        = bool
  default     = false
}
variable "custom_express_route_gateway_name" {
  description = "Custom Express Route Gateway name"
  type        = string
  default     = null
}

variable "express_route_gateway_exta_tags" {
  description = "Extra tags for Express Route Gateway"
  type        = map(string)
  default     = {}
}

variable "custom_express_route_circuit_name" {
  description = "Custom Express Route Circuit name"
  type        = string
  default     = null
}

variable "express_route_gateway_scale_unit" {
  description = "The number of scale unit with which to provision the Express Route Gateway."
  type        = number
  default     = 1
}
variable "express_route_circuit_peering_location" {
  description = "Express Route Circuit peering location."
  type        = string
  default     = null
}

variable "express_route_circuit_bandwidth_in_mbps" {
  description = "The bandwith in Mbps of the Express Route Circuit being created on the Service Provider"
  type        = number
  default     = null
}

variable "express_route_circuit_service_provider" {
  description = "The name of the Express Route Circuit Service Provider."
  type        = string
  default     = null
}

variable "express_route_sku" {
  description = "Express Route SKU"
  type = object({
    tier   = string,
    family = string
  })
  default = {
    tier   = "Premium"
    family = "MeteredData"
  }
}

variable "express_route_private_peering_enabled" {
  description = "Enable Express Route Circuit Private Peering"
  type        = bool
  default     = false
}

variable "express_route_circuit_private_peering_primary_peer_address_prefix" {
  description = "Primary peer address prefix for Express Route Circuit private peering"
  type        = string
  default     = null
}

variable "express_route_circuit_private_peering_secondary_peer_address_prefix" {
  description = "Secondary peer address prefix for Express Route Circuit private peering"
  type        = string
  default     = null
}

variable "express_route_circuit_private_peering_shared_key" {
  description = "Shared secret key for Express Route Circuit Private Peering"
  type        = string
  default     = null
}

variable "express_route_circuit_private_peering_vlan_id" {
  description = "VLAN Id for Express Route Circuit"
  type        = number
  default     = null
}

variable "express_route_circuit_private_peering_peer_asn" {
  description = "Peer BGP ASN for Express Route Circuit Private Peering"
  type        = number
  default     = null
}

# Firewall specific variables
variable "firewall_enabled" {
  description = "Enable or not Azure Firewall in the Virtual Hub"
  type        = bool
  default     = true
}

variable "custom_firewall_name" {
  description = "Custom Firewall's name"
  type        = string
  default     = null
}

variable "firewall_extra_tags" {
  description = "Extra tags for Firewall resource"
  type        = map(string)
  default     = {}
}

variable "firewall_sku_tier" {
  description = "SKU tier of the Firewall. Possible values are `Premium` and `Standard`."
  type        = string
  default     = "Standard"
}

variable "firewall_policy_id" {
  description = "ID of the Firewall Policy applied to this Firewall."
  type        = string
  default     = null
}

variable "firewall_availibility_zones" {
  description = "Availability zones in which the Azure Firewall should be created."
  type        = list(number)
  default     = [1, 2, 3]
}

variable "firewall_public_ip_count" {
  description = "Number of public IPs to assign to the Firewall."
  type        = number
  default     = 1
}

variable "firewall_dns_servers" {
  description = "List of DNS servers that the Azure Firewall will direct DNS traffic to for the name resolution"
  type        = list(string)
  default     = null
}

variable "firewall_private_ip_ranges" {
  description = "List of SNAT private CIDR IP ranges, or the special string `IANAPrivateRanges`, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918"
  type        = list(string)
  default     = null
}

variable "peered_virtual_networks" {
  description = "List of Virtual Networks IDs to peer with the Virtual Hub."
  type        = list(string)
  default     = []
}