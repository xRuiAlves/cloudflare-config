module "ruialves_net" {
  source = "./modules/ruialves-net"

  zone_name   = var.ruialves_net_zone_name
  dns_records = var.ruialves_net_dns_records
}
