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

resource "cloudflare_ruleset" "redirects" {
  zone_id = data.cloudflare_zone.this.id
  name    = "Redirect Rules"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"

  rules = [
    for key, rule in var.redirect_rules : {
      ref         = key
      description = rule.description
      expression  = "http.host eq \"${rule.hostname}\""
      action      = "redirect"
      action_parameters = {
        from_value = {
          status_code           = 301
          preserve_query_string = true
          target_url = {
            expression = "concat(\"${rule.target}\", http.request.uri.path)"
          }
        }
      }
    }
  ]
}

resource "cloudflare_zone_dnssec" "this" {
  zone_id = data.cloudflare_zone.this.id
  status  = var.dnssec_status
}
