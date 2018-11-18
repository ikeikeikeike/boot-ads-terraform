
module "vpc" {
  source = "../../modules/gcp/vpc"
}

module "gcs" {
  source = "../../modules/gcp/gcs"
}

module "gke" {
  source = "../../modules/gcp/gke"

  vpc_network_fabg_name                         = "${module.vpc.network_fabg_name}"
  vpc_network_fabg_self_link                    = "${module.vpc.network_fabg_self_link}"
  vpc_subnetwork_fabg_asia_northeast1_name      = "${module.vpc.subnetwork_fabg_asia_northeast1_name}"
  vpc_subnetwork_fabg_asia_northeast1_self_link = "${module.vpc.subnetwork_fabg_asia_northeast1_self_link}"
  zone                                          = "${lookup(var.zone, "${terraform.env}")}"
  min_node_count                                = "${lookup(var.min_node_count, "${terraform.env}.fabg")}"
  max_node_count                                = "${lookup(var.max_node_count, "${terraform.env}.fabg")}"
}

module "dns" {
  source = "../../modules/gcp/dns"

  google_project                                = "${var.google_project}"
  vpc_global_address_fabg_lb_address            = "${module.vpc.global_address_fabg_lb_address}"
}
