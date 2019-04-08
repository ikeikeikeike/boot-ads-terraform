variable "google_project" {}

variable "fabg_dbuser" {}
variable "fabg_dbpass" {}

variable "zone" {
  default = {
    default           = "asia-southeast1-c"
    development       = "asia-east1-c"
    production        = "asia-northeast1-c"
  }
}

variable "region" {
  default = {
    default           = "asia-southeast1"
    development       = "asia-east1"
    production        = "asia-northeast1"
  }
}

variable "min_node_count" {
  type = "map"

  default = {
    default.fabg       = 0
    development.fabg   = 0
    production.fabg    = 1
  }
}

variable "max_node_count" {
  type = "map"

  default = {
    default.fabg       = 0
    development.fabg   = 0
    production.fabg    = 3
  }
}
