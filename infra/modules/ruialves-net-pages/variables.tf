variable "zone_name" {
  description = "Name of the zone, used to look up its account ID"
  type        = string
}

variable "github_owner" {
  description = "GitHub user that owns the project repositories. The Cloudflare GitHub app must have access to each repository."
  type        = string
}

variable "projects" {
  description = "Pages projects, keyed by project name. Each one deploys a GitHub repository on push to its production branch. Without a build command and output directory, the repository root is published as is. Domains are the project's custom domains."
  type = map(object({
    repository        = string
    production_branch = string
    build_command     = optional(string)
    output_directory  = optional(string)
    domains           = set(string)
  }))
}
