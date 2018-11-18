resource "google_storage_bucket" "fabg-storage" {
  name          = "fabg-storage-${terraform.env}"
  location      = "asia-northeast1"
  storage_class = "REGIONAL"

  labels = {
    name   = "fabg-storage"
    deploy = "fabg-storage"
    env    = "${terraform.env}"
  }
}
