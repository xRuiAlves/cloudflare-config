module "ruialves_net" {
  source = "./modules/ruialves-net"

  zone_id     = var.ruialves_net_zone_id
  dns_records = var.ruialves_net_dns_records
}
