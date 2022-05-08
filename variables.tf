variable "id" {
  type    = number
  default = 100
}

variable "name" {
  type = string
}

variable "node" {
  type = string
}

variable "count_masters" {
  type    = number
  validation {
    condition = (
      var.count_masters >= 3 && var.count_masters <= 9
    )
    error_message = "Must be between 3 and 9, inclusive."
  }
  default = 3
}

variable "master_instance_template" {
  type    = string
  default = "ubuntu-focal-server-cloudinit"
}

variable "master_instance_memory" {
  type    = number
  default = 8000
}

variable "master_instance_cpus" {
  type    = string
  default = 2
}

variable "master_instance_disk_size" {
  type    = string
  default = "19660M"
}

variable "master_instance_disk_backend" {
  type    = string
  default = "local-lvm"
}

variable "count_workers" {
  type    = number
  validation {
    condition = (
      var.count_masters >= 0 && var.count_masters <= 9
    )
    error_message = "Must be between 0 and 9, inclusive."
  }
  default = 0
}

variable "worker_instance_template" {
  type    = string
  default = "ubuntu-focal-server-cloudinit"
}

variable "worker_instance_memory" {
  type    = number
  default = 8000
}

variable "worker_instance_cpus" {
  type    = string
  default = 2
}

variable "worker_instance_disk_size" {
  type    = string
  default = "19660M"
}

variable "worker_instance_disk_backend" {
  type    = string
  default = "local-lvm"
}

variable "network_ip_prefix" {
  type = string
}

variable "network_gateway" {
  type = string
}

variable "ssh_authorized_keys" {
  type = string
}

variable "zerotier_subnet" {
  type = string
}

variable "bastion_user" {
  type = string
}

variable "bastion_host" {
  type = string
}

variable "cloudflare_email" {
  type        = string
  description = ""
}

variable "cloudflare_zone_id" {
  type        = string
  description = ""
}

variable "cloudflare_token" {
  type        = string
  description = ""
}