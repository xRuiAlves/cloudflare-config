data "cloudflare_zone" "this" {
  filter = {
    name = var.zone_name
  }
}

resource "cloudflare_email_routing_settings" "this" {
  zone_id            = data.cloudflare_zone.this.id
  support_subaddress = var.subaddressing
}

resource "cloudflare_email_routing_address" "this" {
  for_each = var.destination_addresses

  account_id = data.cloudflare_zone.this.account.id
  email      = each.value
}

resource "cloudflare_email_routing_rule" "this" {
  for_each = var.routing_rules

  zone_id  = data.cloudflare_zone.this.id
  name     = each.value.name
  enabled  = each.value.enabled
  priority = each.value.priority

  matchers = [{
    type  = "literal"
    field = "to"
    value = each.value.address
  }]

  actions = [{
    type  = "forward"
    value = [cloudflare_email_routing_address.this[each.value.destination].email]
  }]
}

resource "cloudflare_email_routing_catch_all" "this" {
  zone_id = data.cloudflare_zone.this.id
  name    = var.catch_all.name
  enabled = var.catch_all.enabled

  matchers = [{
    type = "all"
  }]

  actions = [{
    type  = var.catch_all.action
    value = var.catch_all.destination == null ? null : [cloudflare_email_routing_address.this[var.catch_all.destination].email]
  }]
}
