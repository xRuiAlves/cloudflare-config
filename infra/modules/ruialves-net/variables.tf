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

variable "caa_records" {
  description = "CAA records of the zone, keyed by a short name. A TTL of 1 means Auto."
  type = map(object({
    name  = string
    flags = number
    tag   = string
    value = string
    ttl   = number
  }))
}

variable "redirect_rules" {
  description = "Redirect Rules of the zone, keyed by a short name. Each one sends every path of a hostname to a target origin with a 301."
  type = map(object({
    description = string
    hostname    = string
    target      = string
  }))
}

variable "dnssec_status" {
  description = "DNSSEC status of the zone, active or disabled"
  type        = string
}
