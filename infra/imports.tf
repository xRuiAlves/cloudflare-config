# Bring the Pages projects and custom domains created in the dashboard under OpenTofu. Remove after the first apply.
locals {
  # Project name of each custom domain. The import for_each must be known before apply, so it reads the locals.
  ruialves_net_pages_domain_projects = merge([
    for name, project in local.ruialves_net_pages_projects : { for domain in project.domains : domain => name }
  ]...)
}

import {
  for_each = local.ruialves_net_pages_projects
  to       = module.ruialves_net_pages.cloudflare_pages_project.this[each.key]
  id       = "${module.ruialves_net_pages.account_id}/${each.key}"
}

import {
  for_each = local.ruialves_net_pages_domain_projects
  to       = module.ruialves_net_pages.cloudflare_pages_domain.this[each.key]
  id       = "${module.ruialves_net_pages.account_id}/${each.value}/${each.key}"
}

# Adding the custom domains in the dashboard replaced these DNS records with new ones, so they have new IDs.
import {
  for_each = {
    apex  = "f340859f070c9907bce6d564fcdbbcfa"
    blog  = "c42c1a9265263a90460425d26e7eff5b"
    chess = "52c5780d3e804b85716e0293eae3c3b1"
  }
  to = module.ruialves_net.cloudflare_dns_record.this[each.key]
  id = "2c76a131fe0ab884ac7702fad430bdce/${each.value}"
}
