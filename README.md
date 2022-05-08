# Proxmox Kubernetes Cluster

This module provisions a Proxmox Kubernetes Cluster with Proxmox Virtual Machines.

```hcl
module "kubernetes_node" {
  source = "jakoberpf/kubernetes-cluster-proxmox"
  providers = {
    cloudflare     = cloudflare
    proxmox        = proxmox
    remote         = remote.proxmox
    remote.gateway = remote.gateway
    zerotier       = zerotier
  }

  id                           = 20
  name                         = "cluster"
  node                         = "dev"
  count_masters                = 3
  master_instance_template     = "ubuntu-focal-cloudinit"
  master_instance_cpus         = 2
  master_instance_memory       = 8000
  master_instance_disk_backend = "vm-storage"
  master_instance_disk_size    = "19660M"
  count_workers                = 3
  worker_instance_template     = "ubuntu-focal-cloudinit"
  worker_instance_cpus         = 4
  worker_instance_memory       = 16000
  worker_instance_disk_backend = "vm-storage"
  worker_instance_disk_size    = "39116M"
  network_ip_prefix            = "192.168.0.1"
  network_gateway              = "192.168.0.1"
  ssh_authorized_keys          = var.authorized_keys
  zerotier_subnet              = "10.110.180.0"
  bastion_host                 = "10.147.19.60"
  bastion_user                 = "root"
  cloudflare_email             = var.cloudflare_email
  cloudflare_zone_id           = var.cloudflare_zone_id
  cloudflare_token             = var.cloudflare_token
}
```
