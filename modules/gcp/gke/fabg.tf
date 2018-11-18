resource "google_container_cluster" "fabg" {
  name               = "fabg"
  min_master_version = "1.11.2-gke.18"
  node_version       = "1.11.2-gke.18"
  zone               = "${var.zone}"
  initial_node_count = "${var.min_node_count}"
  network            = "${var.vpc_network_fabg_self_link}"
  subnetwork         = "${var.vpc_subnetwork_fabg_asia_northeast1_self_link}"

  maintenance_policy {
    daily_maintenance_window {
      start_time = "05:00"
    }
  }

  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]

    labels = {
      name   = "${format("fabg-%02d", count.index + 1)}"
      deploy = "fabg"
      env    = "${terraform.env}"
    }

    tags = [
      "${terraform.env}",
      "${format("fabg-%02d", count.index + 1)}",
      "fabg",
    ]
  }
}

resource "google_container_node_pool" "fabg-np" {
  name               = "fabg-np"
  zone               = "${var.zone}"
  version            = "1.11.2-gke.18"
  cluster            = "${google_container_cluster.fabg.name}"
  initial_node_count = "${var.min_node_count}"

  autoscaling {
    min_node_count = "${var.min_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]

    labels = {
      name   = "${format("fabg-np-%02d", count.index + 1)}"
      deploy = "fabg-np"
      env    = "${terraform.env}"
    }

    tags = [
      "${terraform.env}",
      "${format("fabg-np-%02d", count.index + 1)}",
      "fabg-np",
    ]
  }
}


