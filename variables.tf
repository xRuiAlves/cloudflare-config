variable "ruialves_net_zone_name" {
  description = "Name of the ruialves.net zone, used to look up its ID"
  type        = string
}

variable "ruialves_net_dns_records" {
  description = "DNS records of the ruialves.net zone, keyed by a short name. A TTL of 1 means Auto."
  type = map(object({
    name    = string
    type    = string
    content = string
    ttl     = number
    proxied = bool
  }))
}
