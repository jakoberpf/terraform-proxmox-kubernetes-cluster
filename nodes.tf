module "kubernetes_node_0" {
  count  = 1
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance"
  providers = {
    proxmox  = proxmox
    remote   = remote
    zerotier = zerotier
  }

  id                     = "${var.id_prefix}0"
  name                   = var.name
  node                   = var.node
  instance_template      = var.instance_template
  instance_cpus          = var.instance_cpus
  instance_memory        = var.instance_memory
  instance_disk_backend  = var.instance_disk_backend
  network_ip             = "${var.network_ip_prefix}0/24"
  network_gateway        = var.network_gateway
  ssh_authorized_keys    = var.ssh_authorized_keys
  zerotier_network_id    = var.zerotier_network_id
  zerotier_ip_assignment = "10.147.19.110"
}
