terraform {
  required_version = ">= 1.12.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.28.1"
    }
  }

  backend "local" {
    path = "backend/terraform.tfstate"
  }
}
