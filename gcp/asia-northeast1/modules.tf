
module "vpc" {
  source = "../../modules/gcp/vpc"
}

module "gcs" {
  source = "../../modules/gcp/gcs"
}

module "dns" {
  source = "../../modules/gcp/dns"

  google_project                              = "${var.google_project}"
  vpc_global_address_fabg_lb_address          = "${module.vpc.global_address_fabg_lb_address}"
}
