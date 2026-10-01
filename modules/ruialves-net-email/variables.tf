variable "zone_name" {
  description = "Name of the zone, used to look up its ID and its account ID"
  type        = string
}

variable "subaddressing" {
  description = "Whether routing rules also match plus-addresses, for example rui+news@ruialves.net"
  type        = bool
}

variable "destination_addresses" {
  description = "Addresses that mail can be forwarded to, keyed by a short name. They belong to the account, not to the zone."
  type        = map(string)
}

variable "routing_rules" {
  description = "Routing rules, keyed by a short name. Each rule forwards mail for one address to one destination address key."
  type = map(object({
    name        = string
    address     = string
    destination = string
    enabled     = bool
    priority    = number
  }))
}

variable "catch_all" {
  description = "Rule for mail to addresses that no routing rule matches. The action is forward or drop. The destination is a destination address key, or null for drop."
  type = object({
    name        = string
    enabled     = bool
    action      = string
    destination = string
  })
}
