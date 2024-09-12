provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork_a" {
  name          = "${var.network_name}-subnet-a"
  ip_cidr_range = var.subnet_a_cidr
  region        = var.region_a
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnetwork_b" {
  name          = "${var.network_name}-subnet-b"
  ip_cidr_range = var.subnet_b_cidr
  region        = var.region_b
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance_group" "instance_group_a" {
  name        = "${var.instance_group_name}-a"
  zone        = var.zone_a
  network     = google_compute_network.vpc_network.id
  subnetwork  = google_compute_subnetwork.subnetwork_a.id

  instances = var.instance_ids_a
}

resource "google_compute_instance_group" "instance_group_b" {
  name        = "${var.instance_group_name}-b"
  zone        = var.zone_b
  network     = google_compute_network.vpc_network.id
  subnetwork  = google_compute_subnetwork.subnetwork_b.id

  instances = var.instance_ids_b
}

resource "google_compute_region_backend_service" "backend_service" {
  name                  = var.backend_service_name
  load_balancing_scheme = "INTERNAL"
  region                = var.region_a

  backend {
    group = google_compute_instance_group.instance_group_a.id
  }

  backend {
    group = google_compute_instance_group.instance_group_b.id
  }

  health_checks = [google_compute_health_check.default.id]
}

resource "google_compute_health_check" "default" {
  name               = "${var.backend_service_name}-health-check"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  tcp_health_check {
    port = var.health_check_port
  }
}

resource "google_compute_forwarding_rule" "ilb" {
  name                  = var.forwarding_rule_name
  region                = var.region_a
  ip_address            = google_compute_address.ilb_ip.address
  backend_service       = google_compute_region_backend_service.backend_service.id
  load_balancing_scheme = "INTERNAL"
  network_tier         = "STANDARD"
}

resource "google_compute_address" "ilb_ip" {
  name   = var.ilb_ip_name
  region = var.region_a
}
