output "ilb_ip" {
  description = "The IP address of the internal load balancer."
  value       = google_compute_address.ilb_ip.address
}

output "backend_service_id" {
  description = "The ID of the backend service."
  value       = google_compute_region_backend_service.backend_service.id
}