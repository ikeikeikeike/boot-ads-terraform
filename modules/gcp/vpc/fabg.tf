resource "google_compute_network" "fabg" {
  name                    = "fabg"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "fabg-asia-northeast1" {
  name          = "fabg"
  ip_cidr_range = "10.0.0.0/20"
  network       = "${google_compute_network.fabg.name}"
  region        = "asia-northeast1"
}

resource "google_compute_subnetwork" "fabg-asia-southeast1" {
  name          = "fabg"
  ip_cidr_range = "10.2.0.0/20"
  network       = "${google_compute_network.fabg.name}"
  region        = "asia-southeast1"
}

resource "google_compute_subnetwork" "fabg-asia-east1" {
  name          = "fabg"
  ip_cidr_range = "10.4.0.0/20"
  network       = "${google_compute_network.fabg.name}"
  region        = "asia-east1"
}
