data "cloudflare_zone" "this" {
  filter = {
    name = var.zone_name
  }
}

locals {
  # Map each custom domain to its project
  domain_projects = merge([for name, project in var.projects : { for domain in project.domains : domain => name }]...)
}

resource "cloudflare_pages_project" "this" {
  for_each = var.projects

  account_id        = data.cloudflare_zone.this.account.id
  name              = each.key
  production_branch = each.value.production_branch

  # A project without a build has no build config. Setting empty strings would show a change on every plan.
  build_config = each.value.build_command == null && each.value.output_directory == null ? null : {
    build_command   = each.value.build_command
    destination_dir = each.value.output_directory
  }

  source = {
    type = "github"
    config = {
      owner             = var.github_owner
      repo_name         = each.value.repository
      production_branch = each.value.production_branch
    }
  }
}

resource "cloudflare_pages_domain" "this" {
  for_each = local.domain_projects

  account_id   = data.cloudflare_zone.this.account.id
  project_name = cloudflare_pages_project.this[each.value].name
  name         = each.key
}
