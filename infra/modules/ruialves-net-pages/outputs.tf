output "account_id" {
  description = "ID of the account that owns the zone and the Pages projects"
  value       = data.cloudflare_zone.this.account.id
}
