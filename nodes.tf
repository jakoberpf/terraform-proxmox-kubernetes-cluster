module "kubernetes_node_0" {
  count  = 3
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance"
  providers = {
    proxmox  = proxmox
    remote   = remote
    zerotier = zerotier
  }

  id                     = join("", [var.id_prefix, 0, count.index])
  name                   = var.name
  node                   = var.node
  instance_template      = var.instance_template
  instance_cpus          = var.instance_cpus
  instance_memory        = var.instance_memory
  instance_disk_backend  = var.instance_disk_backend
  network_ip             = join("", [var.network_ip_prefix, count.index, "/24"])
  network_gateway        = var.network_gateway
  ssh_authorized_keys    = var.ssh_authorized_keys
  zerotier_network_id    = module.zerotier_cluster_network.network_ids[0]
  zerotier_ip_assignment = join("", ["10.110.180.11", count.index])
}
