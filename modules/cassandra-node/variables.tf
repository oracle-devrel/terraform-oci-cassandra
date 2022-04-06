# OCI service
variable "compartment_ocid" {
  description = "Compartment OCID where VCN is created. "
}

variable "availability_domains" {
  description = "The Availability Domain(s) for Cassandra node(s). "
  default     = []
}

variable "subnet_ids" {
  description = "List of Cassandra node subnets' ids. "
  default     = []
}

variable "vcn_cidr" {
  description = "Virtual Cloud Network's CIDR block. "
  default     = ""
}

variable "node_display_name" {
  description = "The name of the Cassandra node. "
  default     = ""
}

variable "cluster_display_name" {
  description = "The Cassandra cluster name. "
  default     = ""
}

variable "shape" {
  type        = string
  description = "Instance shape for node instance to use. "
  default     = ""
}

variable "flex_shape_ocpus" {
  default = 1
}

variable "flex_shape_memory" {
  default = 10
}

variable "label_prefix" {
  description = "To create unique identifier for multiple clusters in a compartment."
  default     = ""
}

variable "number_of_nodes" {
  description = "The number of Cassandra node(s) to create"
  default     = 3
}

variable "number_of_seeds" {
  description = "The number of Cassandra seed node(s) to create"
  default     = 3
}

variable "assign_public_ip" {
  description = "Whether the VNIC should be assigned a public IP address. Default 'true' assigns a public IP address. "
  default     = true
}

variable "ssh_authorized_keys" {
  description = "Public SSH keys path to be included in the ~/.ssh/authorized_keys file for the default user on the instance. "
  default     = ""
}

variable "ssh_private_key" {
  description = "The private key path to access instance. "
  default     = ""
}

variable "image_id" {
  description = "The OCID of an image on which the Cassandra node instance is based. "
  default     = ""
}

variable "storage_port" {
  description = "TCP port for commands and data among Cassandra nodes. "
}

variable "ssl_storage_port" {
  description = "SSL port for encrypted communication among Cassandra nodes. "
}

variable "cassandra_version" {
  description = "Version of Cassandra software"
  default     = "4.0.3"
}

variable "cassandra_version_code" {
  description = "Cassandra version code for the Apache download URL"
  default     = "40x"
}

variable "defined_tags" {
  description = "Defined tags for Cassandra nodes."
  type        = map(string)
  default     = {}
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex",
    "VM.Optimized3.Flex"
  ]
}

variable "use_private_subnet" {
  description = "Hide Cassandra nodes in private subnet"
  default     = false
}

variable "bastion_service_id" {
  description = "Bastion Service OCID"
  default     = ""
}

variable "bastion_service_region" {
  description = "Bastion Service Region"
  default     = ""
}


# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.shape)
}
