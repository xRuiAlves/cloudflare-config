ruialves_net_zone_name = "ruialves.net"

# Email Routing manages the MX records and the cf2024-1._domainkey DKIM record, so they are not here.
ruialves_net_dns_records = {
  apex = {
    name    = "ruialves.net"
    type    = "A"
    content = "75.2.60.5"
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
