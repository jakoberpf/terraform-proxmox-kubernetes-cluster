variable "id_prefix" {
  type    = number
  default = 100
}

variable "name" {
  type = string
}

variable "compartment" {
  type    = string
  default = "default"
}

variable "node" {
  type = string
}

variable "instance_template" {
  type    = string
  default = "ubuntu-focal-server-cloudinit"
}

variable "instance_memory" {
  type    = number
  default = 8000
}

variable "instance_cpus" {
  type    = string
  default = 2
}

variable "instance_disk_size" {
  type    = string
  default = "19660M"
}

variable "instance_disk_backend" {
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

variable "zerotier_network_id" {
  type = string
}

variable "zerotier_ip_assignment" {
  type = string
}
