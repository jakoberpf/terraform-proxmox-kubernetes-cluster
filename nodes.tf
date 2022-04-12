module "kubernetes_node_0" {
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance"
  providers = {
    proxmox  = proxmox
    remote   = remote
    zerotier = zerotier
  }

  id                     = 200
  name                   = "kubernetes-0"
  compartment            = "development"
  node                   = "dev"
  instance_template      = "ubuntu-focal-cloudinit"
  instance_cpus          = 4
  instance_memory        = 16384
  instance_disk_backend  = "local-zfs"
  network_ip             = "192.168.0.10/24"
  network_gateway        = "192.168.0.1"
  ssh_authorized_keys    = var.ssh_authorized_keys
  zerotier_network_id    = var.zerotier_network_id
  zerotier_ip_assignment = "10.147.19.110"
}
