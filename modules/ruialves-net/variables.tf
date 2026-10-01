variable "zone_id" {
  description = "ID of the ruialves.net zone"
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
