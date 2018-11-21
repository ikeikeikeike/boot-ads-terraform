
output "dns_fabg_private_key_pem"  { value = "${module.dns.fabg_private_key_pem}" }
resource "local_file" "dns_fabg_private_key_pem" {
    content  = "${module.dns.fabg_private_key_pem}"
    filename = "${path.module}/fabg.key"
}

output "dns_fabg_certificate_pem"  { value = "${module.dns.fabg_certificate_pem}" }
resource "local_file" "dns_fabg_certificate_pem" {
    content  = "${module.dns.fabg_certificate_pem}"
    filename = "${path.module}/fabg.cert"
}

output "dns_fabg_issuer_pem"  { value = "${module.dns.fabg_issuer_pem}" }
resource "local_file" "dns_fabg_issuer_pem" {
    content  = "${module.dns.fabg_certificate_pem}${module.dns.fabg_issuer_pem}"
    filename = "${path.module}/fabg.chain"
}
