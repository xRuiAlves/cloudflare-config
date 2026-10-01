# Cloudflare configs

OpenTofu configuration for my Cloudflare account.

## Usage

1. Set the API token:

   ```sh
   export CLOUDFLARE_API_TOKEN=<token>
   ```

2. Go to the `infra` directory:

   ```sh
   cd infra
   ```

3. Initialize the working directory:

   ```sh
   tofu init
   ```

4. Make a plan:

   ```sh
   tofu plan -out=cloudflare.tfplan
   ```

5. Apply the plan:

   ```sh
   tofu apply cloudflare.tfplan
   ```

6. Commit `infra/backend/terraform.tfstate`.
