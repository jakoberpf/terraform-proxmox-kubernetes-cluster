# Proxmox Kubernetes Cluster

This module provisions a Proxmox Kubernetes Cluster with Proxmox Virtual Machine.

```hcl
module "kubernetes_node" {
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-cluster"
  providers = {
    proxmox  = proxmox
    remote   = remote.proxmox
    zerotier = zerotier
  }

}
```
