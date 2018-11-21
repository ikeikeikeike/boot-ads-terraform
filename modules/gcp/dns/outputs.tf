output "fabg_private_key_pem" { value = "${acme_certificate.fabg.private_key_pem}" }
output "fabg_certificate_pem" { value = "${acme_certificate.fabg.certificate_pem}" }
output "fabg_issuer_pem"      { value = "${acme_certificate.fabg.issuer_pem}" }
