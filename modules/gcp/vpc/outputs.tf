output "network_fabg_name"                          { value = "${google_compute_network.fabg.name }" }
output "network_fabg_self_link"                     { value = "${google_compute_network.fabg.self_link }" }
output "subnetwork_fabg_asia_northeast1_name"       { value = "${google_compute_subnetwork.fabg-asia-northeast1.name }" }
output "subnetwork_fabg_asia_northeast1_self_link"  { value = "${google_compute_subnetwork.fabg-asia-northeast1.self_link }" }
output "global_address_fabg_lb_address"             { value = "${google_compute_global_address.fabg-lb.address }" }

