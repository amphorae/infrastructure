provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

resource "cloudflare_record" "mx_alt1" {
  domain   = "amphorae.xyz"
  name     = "amphorae.xyz"
  value    = "alt1.aspmx.l.google.com"
  type     = "MX"
  priority = "5"
}

resource "cloudflare_record" "mx_alt2" {
  domain   = "amphorae.xyz"
  name     = "amphorae.xyz"
  value    = "alt2.aspmx.l.google.com"
  type     = "MX"
  priority = "5"
}

resource "cloudflare_record" "mx_aspmx" {
  domain   = "amphorae.xyz"
  name     = "amphorae.xyz"
  value    = "aspmx.l.google.com"
  type     = "MX"
  priority = "1"
}

resource "cloudflare_record" "mx_aspmx2" {
  domain   = "amphorae.xyz"
  name     = "amphorae.xyz"
  value    = "aspmx2.googlemail.com"
  type     = "MX"
  priority = "10"
}

resource "cloudflare_record" "mx_aspmx3" {
  domain   = "amphorae.xyz"
  name     = "amphorae.xyz"
  value    = "aspmx3.googlemail.com"
  type     = "MX"
  priority = "10"
}

resource "cloudflare_record" "google" {
  domain = "amphorae.xyz"
  name   = "amphorae.xyz"
  value  = "google-site-verification=UHqO8TbKjOCEAEiLihwhTf0xXHsYjwT84_TDlOsAsks"
  type   = "TXT"
}

resource "cloudflare_record" "github" {
  domain = "amphorae.xyz"
  name   = "_github-challenge-amphorae.amphorae.xyz."
  value  = "96b31a5f5a"
  type   = "TXT"
}
