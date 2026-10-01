# Cloudflare

OpenTofu configuration for my Cloudflare account.

At the moment, it manages the DNS records of `ruialves.net`.

## Layout

| Path | Contents |
|---|---|
| `config.tf` | The OpenTofu version, the provider version, and the local backend |
| `provider.tf` | The Cloudflare provider |
| `main.tf` | The module instances |
| `values.tf` | The values that the module instances use, as locals |
| `modules/ruialves-net` | The DNS records of `ruialves.net` |

## Prerequisites

- OpenTofu 1.12 or later
- A Cloudflare API token on `ruialves.net` with these permissions:
  - `Zone > Zone > Read`, to look up the zone ID from the zone name
  - `Zone > DNS > Edit`, to manage the DNS records

The provider reads the token from the `CLOUDFLARE_API_TOKEN` environment variable. Do not put the token in a file in this repository.

## Usage

1. Set the API token:

   ```sh
   export CLOUDFLARE_API_TOKEN=<token>
   ```

2. Initialize the working directory:

   ```sh
   tofu init
   ```

3. Make a plan:

   ```sh
   tofu plan -out=cloudflare.tfplan
   ```

4. Apply the plan:

   ```sh
   tofu apply cloudflare.tfplan
   ```

5. Commit `terraform.tfstate`.

## State

The state is in `terraform.tfstate` on the local filesystem, and git tracks it. Commit the state after each apply, so that each clone has the current state. The state does not contain the API token.

Also commit `.terraform.lock.hcl`. It pins the provider checksums.

## DNS records

To add, change, or remove a DNS record, edit `ruialves_net_dns_records` in `values.tf`. Then make a plan and apply it.

Use the full name of the record, for example `blog.ruialves.net`. A TTL of `1` means Auto.

Email Routing manages these records:

- The three `MX` records
- The `cf2024-1._domainkey` DKIM `TXT` record

They are not in this configuration. Do not add them. To change them, use the Email Routing page in the Cloudflare dashboard.
