module "ruialves_net" {
  source = "./modules/ruialves-net"

  zone_name     = local.ruialves_net_zone_name
  dns_records   = local.ruialves_net_dns_records
  caa_records   = local.ruialves_net_caa_records
  dnssec_status = local.ruialves_net_dnssec_status
}
