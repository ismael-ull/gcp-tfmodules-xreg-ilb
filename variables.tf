variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "region" {
  description = "The region for the resources."
  type        = string
}

variable "region_a" {
  description = "The first region for the instance group."
  type        = string
}

variable "region_b" {
  description = "The second region for the instance group."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "subnet_a_cidr" {
  description = "CIDR range for the first subnet."
  type        = string
}

variable "subnet_b_cidr" {
  description = "CIDR range for the second subnet."
  type        = string
}

variable "instance_group_name" {
  description = "The name of the instance groups."
  type        = string
}

variable "zone_a" {
  description = "The zone for the first instance group."
  type        = string
}

variable "zone_b" {
  description = "The zone for the second instance group."
  type        = string
}

variable "instance_ids_a" {
  description = "List of instance IDs for the first instance group."
  type        = list(string)
}

variable "instance_ids_b" {
  description = "List of instance IDs for the second instance group."
  type        = list(string)
}

variable "backend_service_name" {
  description = "The name of the backend service."
  type        = string
}

variable "health_check_port" {
  description = "The port for the health check."
  type        = number
}

variable "forwarding_rule_name" {
  description = "The name of the forwarding rule."
  type        = string
}

variable "ilb_ip_name" {
  description = "The name of the internal load balancer IP address."
  type        = string
}