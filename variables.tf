variable "ruialves_net_zone_id" {
  description = "ID of the ruialves.net zone"
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
