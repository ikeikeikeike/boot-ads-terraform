provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "fabg" {
  algorithm = "RSA"
}

resource "acme_registration" "fabg" {
  account_key_pem = "${tls_private_key.fabg.private_key_pem}"
  email_address   = "jp.ne.co.jp@gmail.com"
}

resource "acme_certificate" "fabg" {
  account_key_pem           = "${acme_registration.fabg.account_key_pem}"
  common_name               = "${replace(google_dns_record_set.fabg.name, "/\\.$/", "")}"
  # subject_alternative_names = ["www2.example.com"]

  dns_challenge {
    provider = "gcloud"

    config {
      GCE_PROJECT = "${var.google_project}"
    }
  }
}

resource "google_compute_ssl_certificate" "fabg" {
  name_prefix = "fabg--"
  private_key = "${acme_certificate.fabg.private_key_pem}"
  certificate = "${acme_certificate.fabg.certificate_pem}"
}
