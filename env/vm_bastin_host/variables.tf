########
#Global#
########
variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "Region where the instance template and instance should be created."
}

###################
#Network-Interface#
###################
variable "network" {
  description = "The name or self_link of the network to attach this interface to. Use network attribute for Legacy or  subnetted networks and subnetwork for custom subnetted networks."
  default     = ""
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be created in. Either network or subnetwork must be provided."
  default     = ""
}

variable "disk_snapshot_policy_name" {
  description = "The name of snapshot policy name for boot and additional disk of GCE instance."
}

#################
#Service Account#
#################
variable "service_account" {
  type = object({
    email  = string
    scopes = set(string)
  })
  description = "Service account to attach to the instance"
}

variable "metadata" {
  type        = map(string)
  description = "Metadata, provided as a map"
  default     = {}
}

variable "ssh_keys" {
  default = {}
}

variable "bastion_host" {
  description = "bastion host specifications"
}

