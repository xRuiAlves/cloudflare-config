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
