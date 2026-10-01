locals {
  ruialves_net_zone_name     = "ruialves.net"
  ruialves_net_dnssec_status = "active"

  # Email Routing manages the MX records and the cf2024-1._domainkey DKIM record, so they are not here.
  ruialves_net_dns_records = {
    apex = {
      name    = "ruialves.net"
      type    = "CNAME"
      content = "apex-loadbalancer.netlify.com"
      ttl     = 1
      proxied = false
    }
    blog = {
      name    = "blog.ruialves.net"
      type    = "CNAME"
      content = "rui-alves-blog.netlify.app"
      ttl     = 1
      proxied = false
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
      content = "rui-alves-resume.netlify.app"
      ttl     = 1
      proxied = false
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
}
