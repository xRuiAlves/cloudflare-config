# Cloudflare configs

OpenTofu configuration for my Cloudflare account.

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
