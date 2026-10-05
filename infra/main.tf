module "ruialves_net" {
  source = "./modules/ruialves-net"

  zone_name      = local.ruialves_net_zone_name
  dns_records    = local.ruialves_net_dns_records
  caa_records    = local.ruialves_net_caa_records
  redirect_rules = local.ruialves_net_redirect_rules
  dnssec_status  = local.ruialves_net_dnssec_status
}

module "ruialves_net_email" {
  source = "./modules/ruialves-net-email"

  zone_name             = local.ruialves_net_zone_name
  subaddressing         = local.ruialves_net_email_subaddressing
  destination_addresses = local.ruialves_net_email_destination_addresses
  routing_rules         = local.ruialves_net_email_routing_rules
  catch_all             = local.ruialves_net_email_catch_all
}

module "ruialves_net_pages" {
  source = "./modules/ruialves-net-pages"

  zone_name    = local.ruialves_net_zone_name
  github_owner = local.ruialves_net_pages_github_owner
  projects     = local.ruialves_net_pages_projects
}
