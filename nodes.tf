module "masters" {
  count  = var.count_masters
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance"
  providers = {
    proxmox  = proxmox
    remote   = remote
    zerotier = zerotier
  }

  id                     = join("", [var.id, 0, count.index])
  name                   = "${var.name}-master-${count.index}"
  node                   = var.node
  instance_template      = var.master_instance_template
  instance_cpus          = var.master_instance_cpus
  instance_memory        = var.master_instance_memory
  instance_disk_backend  = var.master_instance_disk_backend
  instance_disk_size     = var.master_instance_disk_size
  network_ip             = join("", [var.network_ip_prefix, "1", count.index, "/24"])
  network_gateway        = var.network_gateway
  ssh_authorized_keys    = var.ssh_authorized_keys
  zerotier_network_id    = module.zerotier_cluster_network.network_ids[0]
  zerotier_ip_assignment = join("", ["10.110.180.11", count.index])
}

module "workers" {
  count  = var.count_workers
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance"
  providers = {
    proxmox  = proxmox
    remote   = remote
    zerotier = zerotier
  }

  id                     = join("", [var.id, 1, count.index])
  name                   = "${var.name}-worker-${count.index}"
  node                   = var.node
  instance_template      = var.worker_instance_template
  instance_cpus          = var.worker_instance_cpus
  instance_memory        = var.worker_instance_memory
  instance_disk_backend  = var.worker_instance_disk_backend
  instance_disk_size     = var.worker_instance_disk_size
  network_ip             = join("", [var.network_ip_prefix, "2", count.index, "/24"])
  network_gateway        = var.network_gateway
  ssh_authorized_keys    = var.ssh_authorized_keys
  zerotier_network_id    = module.zerotier_cluster_network.network_ids[0]
  zerotier_ip_assignment = join("", ["10.110.180.12", count.index])
}
