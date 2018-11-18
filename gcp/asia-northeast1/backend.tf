terraform {
  required_version = ">= 0.11.10"

  backend "gcs" {
    bucket = "boot-ads-tf-tfstate"
    prefix = "boot-ads/tf.tfstate"
  }
}
