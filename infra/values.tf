locals {
  ruialves_net_zone_name     = "ruialves.net"
  ruialves_net_dnssec_status = "active"

  # Email Routing manages the MX records and the cf2024-1._domainkey DKIM record, so they are not here.
  # Cloudflare Pages sites use a proxied CNAME to <project>.pages.dev. Apply the custom domain in
  # ruialves_net_pages_projects before pointing the record at it, or the site returns 522 errors.
  ruialves_net_dns_records = {
    apex = {
      name    = "ruialves.net"
      type    = "CNAME"
      content = "personal-page-e8l.pages.dev"
      ttl     = 1
      proxied = true
    }
    blog = {
      name    = "blog.ruialves.net"
      type    = "CNAME"
      content = "blog-16j.pages.dev"
      ttl     = 1
      proxied = true
    }
    chess = {
      name    = "chess.ruialves.net"
      type    = "CNAME"
      content = "chess-games-agt.pages.dev"
      ttl     = 1
      proxied = true
    }
    python-workshop = {
      name    = "python-workshop.ruialves.net"
      type    = "CNAME"
      content = "ws-python-ni.netlify.app"
      ttl     = 1
      proxied = false
    }
    wvat-presentation = {
      name    = "wvat-presentation.ruialves.net"
      type    = "CNAME"
      content = "wvat-presentation.netlify.app"
      ttl     = 1
      proxied = false
    }
    www = {
      name    = "www.ruialves.net"
      type    = "CNAME"
      content = "ruialves.net"
      ttl     = 1
      proxied = true
    }
    dmarc = {
      name    = "_dmarc.ruialves.net"
      type    = "TXT"
      content = "\"v=DMARC1; p=none; rua=mailto:rui@ruialves.net\""
      ttl     = 1
      proxied = false
    }
    spf = {
      name    = "ruialves.net"
      type    = "TXT"
      content = "\"v=spf1 include:_spf.mx.cloudflare.net include:_spf.google.com ~all\""
      ttl     = 1
      proxied = false
    }
  }

  # Netlify uses Let's Encrypt. Cloudflare Universal SSL uses Let's Encrypt, Google Trust Services, and SSL.com.
  ruialves_net_caa_records = {
    letsencrypt = {
      name  = "ruialves.net"
      flags = 0
      tag   = "issue"
      value = "letsencrypt.org"
      ttl   = 1
    }
    google-trust-services = {
      name  = "ruialves.net"
      flags = 0
      tag   = "issue"
      value = "pki.goog"
      ttl   = 1
    }
    ssl-com = {
      name  = "ruialves.net"
      flags = 0
      tag   = "issue"
      value = "ssl.com"
      ttl   = 1
    }
  }

  # Redirect Rules run at the edge, so each hostname needs a proxied DNS record.
  ruialves_net_redirect_rules = {
    www = {
      description = "Redirect www.ruialves.net to ruialves.net"
      hostname    = "www.ruialves.net"
      target      = "https://ruialves.net"
    }
  }

  # The Cloudflare GitHub app is connected to this GitHub account once, in the dashboard.
  ruialves_net_pages_github_owner = "xRuiAlves"

  ruialves_net_pages_projects = {
    blog = {
      repository        = "blog"
      production_branch = "main"
      build_command     = "npm run build"
      output_directory  = "dist"
      domains           = ["blog.ruialves.net"]
    }
    chess-games = {
      repository        = "chess-games"
      production_branch = "main"
      build_command     = "npm run build"
      output_directory  = "dist"
      domains           = ["chess.ruialves.net"]
    }
    personal-page = {
      repository        = "personal-page"
      production_branch = "main"
      build_command     = ""
      output_directory  = ""
      domains           = ["ruialves.net"]
    }
  }

  ruialves_net_email_subaddressing = false

  # A new destination address gets a verification email. Rules forward to it only after verification.
  ruialves_net_email_destination_addresses = {
    gmail = "ruialves.esrt.98@gmail.com"
  }

  ruialves_net_email_routing_rules = {
    rui = {
      name        = "Forward rui@ruialves.net to Gmail"
      address     = "rui@ruialves.net"
      destination = "gmail"
      enabled     = true
      priority    = 0
    }
  }

  # When the catch-all is disabled, Cloudflare rejects mail to addresses that no rule matches.
  ruialves_net_email_catch_all = {
    name        = "Catch-all"
    enabled     = false
    action      = "drop"
    destination = null
  }
}
