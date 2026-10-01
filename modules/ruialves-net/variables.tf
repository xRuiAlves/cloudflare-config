variable "zone_name" {
  description = "Name of the zone, used to look up its ID"
  type        = string
}

variable "dns_records" {
  description = "DNS records of the zone, keyed by a short name. A TTL of 1 means Auto."
  type = map(object({
    name    = string
    type    = string
    content = string
    ttl     = number
    proxied = bool
  }))
}
