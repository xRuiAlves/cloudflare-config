data "cloudflare_zone" "this" {
  filter = {
    name = var.zone_name
  }
}

resource "cloudflare_dns_record" "this" {
  for_each = var.dns_records

  zone_id = data.cloudflare_zone.this.id
  name    = each.value.name
  type    = each.value.type
  content = each.value.content
  ttl     = each.value.ttl
  proxied = each.value.proxied
}

resource "cloudflare_dns_record" "caa" {
  for_each = var.caa_records

  zone_id = data.cloudflare_zone.this.id
  name    = each.value.name
  type    = "CAA"
  ttl     = each.value.ttl

  data = {
    flags = each.value.flags
    tag   = each.value.tag
    value = each.value.value
  }
}

resource "cloudflare_zone_dnssec" "this" {
  zone_id = data.cloudflare_zone.this.id
  status  = var.dnssec_status
}
