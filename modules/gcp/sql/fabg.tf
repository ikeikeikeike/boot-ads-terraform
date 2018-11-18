resource "google_sql_database_instance" "fabg" {
  # name                 = "fabg"
  master_instance_name = "fabgmaster"
  database_version     = "MYSQL_5_7"

  settings {
    availability_type           = "ZONAL"
    tier                        = "db-f1-micro"
    activation_policy           = "ALWAYS"
    disk_autoresize             = true
    disk_size                   = 22
    disk_type                   = "PD_SSD"
    pricing_plan                = "PER_USE"
    # authorized_gae_applications = []
    # backup_configuration        = []
    # ip_configuration            = [[{}]]
    # location_preference         = []
    # maintenance_window          = []
    # replication_type            = "ASYNCHRONOUS"
    # database_flags              = []
  }

  # replica_configuration = []
}

resource "google_sql_database" "fabg" {
  instance  = "${google_sql_database_instance.fabg.name}"
  count     = 1
  name      = "fabg"
  charset   = "utf8mb4"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "fabg" {
  instance  = "${google_sql_database_instance.fabg.name}"
  count    = 1
  name     = "${var.fabg_username}"
  password = "${var.fabg_userpass}"
  host     = "%"
}

