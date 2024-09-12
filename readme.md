# GCP Cross-Regional Internal Load Balancer Terraform Module

This Terraform module creates a cross-regional internal load balancer in Google Cloud Platform (GCP). It sets up a VPC network, subnets, instance groups, a backend service, and the internal load balancer itself.

## Requirements

- Terraform 1.0 or later
- Google Cloud Platform account
- Appropriate permissions to create resources in GCP

## Usage

To use this module, create a Terraform configuration file and include the module as shown below:

```hcl
module "cross_regional_ilb" {
  source                = "./gcp-cross-regional-ilb"
  project_id           = "your-project-id"
  region               = "us-central1"
  region_a             = "us-central1"
  region_b             = "us-east1"
  network_name         = "my-vpc-network"
  subnet_a_cidr       = "10.0.1.0/24"
  subnet_b_cidr       = "10.0.2.0/24"
  instance_group_name  = "my-instance-group"
  zone_a               = "us-central1-a"
  zone_b               = "us-east1-b"
  instance_ids_a       = ["instance-id-1", "instance-id-2"]
  instance_ids_b       = ["instance-id-3", "instance-id-4"]
  backend_service_name  = "my-backend-service"
  health_check_port     = 80
  forwarding_rule_name   = "my-ilb-forwarding-rule"
  ilb_ip_name            = "my-ilb-ip"
}

## Inputs

| Name                     | Description                                           | Type         | Default | Required |
|--------------------------|-------------------------------------------------------|--------------|---------|----------|
| `project_id`             | The ID of the project in which to create resources. | `string`     | n/a     | yes      |
| `region`                 | The region for the resources.                        | `string`     | n/a     | yes      |
| `region_a`               | The first region for the instance group.            | `string`     | n/a     | yes      |
| `region_b`               | The second region for the instance group.           | `string`     | n/a     | yes      |
| `network_name`           | The name of the VPC network.                        | `string`     | n/a     | yes      |
| `subnet_a_cidr`         | CIDR range for the first subnet.                    | `string`     | n/a     | yes      |
| `subnet_b_cidr`         | CIDR range for the second subnet.                   | `string`     | n/a     | yes      |
| `instance_group_name`    | The name of the instance groups.                    | `string`     | n/a     | yes      |
| `zone_a`                 | The zone for the first instance group.              | `string`     | n/a     | yes      |
| `zone_b`                 | The zone for the second instance group.             | `string`     | n/a     | yes      |
| `instance_ids_a`         | List of instance IDs for the first instance group.  | `list(string)` | n/a   | yes      |
| `instance_ids_b`         | List of instance IDs for the second instance group. | `list(string)` | n/a   | yes      |
| `backend_service_name`    | The name of the backend service.                    | `string`     | n/a     | yes      |
| `health_check_port`      | The port for the health check.                      | `number`     | n/a     | yes      |
| `forwarding_rule_name`   | The name of the forwarding rule.                    | `string`     | n/a     | yes      |
| `ilb_ip_name`            | The name of the internal load balancer IP address. | `string`     | n/a     | yes      |

## Outputs

| Name                     | Description                                           |
|--------------------------|-------------------------------------------------------|
| `ilb_ip`                 | The IP address of the internal load balancer.       |
| `backend_service_id`     | The ID of the backend service.                       |

## Initialization and Application

To initialize and apply the Terraform configuration, run the following commands:

```bash
terraform init
terraform apply

## License
Free to use

