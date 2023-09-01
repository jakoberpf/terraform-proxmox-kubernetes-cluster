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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 3.8.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.4 |
| <a name="requirement_remote"></a> [remote](#requirement\_remote) | 0.0.23 |
| <a name="requirement_zerotier"></a> [zerotier](#requirement\_zerotier) | 1.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_api"></a> [kubernetes\_api](#module\_kubernetes\_api) | /Users/jakoberpf/Code/jakoberpf/terraform/modules/erpf/caddy-ingress | n/a |
| <a name="module_masters"></a> [masters](#module\_masters) | /Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance | n/a |
| <a name="module_workers"></a> [workers](#module\_workers) | /Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-instance | n/a |
| <a name="module_zerotier_cluster_network"></a> [zerotier\_cluster\_network](#module\_zerotier\_cluster\_network) | jakoberpf/cluster-network/zerotier | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host"></a> [bastion\_host](#input\_bastion\_host) | n/a | `string` | n/a | yes |
| <a name="input_bastion_user"></a> [bastion\_user](#input\_bastion\_user) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_email"></a> [cloudflare\_email](#input\_cloudflare\_email) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_token"></a> [cloudflare\_token](#input\_cloudflare\_token) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | n/a | `string` | n/a | yes |
| <a name="input_count_masters"></a> [count\_masters](#input\_count\_masters) | n/a | `number` | `3` | no |
| <a name="input_count_workers"></a> [count\_workers](#input\_count\_workers) | n/a | `number` | `0` | no |
| <a name="input_id"></a> [id](#input\_id) | n/a | `number` | `100` | no |
| <a name="input_master_instance_cpus"></a> [master\_instance\_cpus](#input\_master\_instance\_cpus) | n/a | `string` | `2` | no |
| <a name="input_master_instance_disk_backend"></a> [master\_instance\_disk\_backend](#input\_master\_instance\_disk\_backend) | n/a | `string` | `"local-lvm"` | no |
| <a name="input_master_instance_disk_size"></a> [master\_instance\_disk\_size](#input\_master\_instance\_disk\_size) | n/a | `string` | `"19660M"` | no |
| <a name="input_master_instance_memory"></a> [master\_instance\_memory](#input\_master\_instance\_memory) | n/a | `number` | `8000` | no |
| <a name="input_master_instance_template"></a> [master\_instance\_template](#input\_master\_instance\_template) | n/a | `string` | `"ubuntu-focal-server-cloudinit"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_gateway"></a> [network\_gateway](#input\_network\_gateway) | n/a | `string` | n/a | yes |
| <a name="input_network_ip_prefix"></a> [network\_ip\_prefix](#input\_network\_ip\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_node"></a> [node](#input\_node) | n/a | `string` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | n/a | `string` | n/a | yes |
| <a name="input_worker_instance_cpus"></a> [worker\_instance\_cpus](#input\_worker\_instance\_cpus) | n/a | `string` | `2` | no |
| <a name="input_worker_instance_disk_backend"></a> [worker\_instance\_disk\_backend](#input\_worker\_instance\_disk\_backend) | n/a | `string` | `"local-lvm"` | no |
| <a name="input_worker_instance_disk_size"></a> [worker\_instance\_disk\_size](#input\_worker\_instance\_disk\_size) | n/a | `string` | `"19660M"` | no |
| <a name="input_worker_instance_memory"></a> [worker\_instance\_memory](#input\_worker\_instance\_memory) | n/a | `number` | `8000` | no |
| <a name="input_worker_instance_template"></a> [worker\_instance\_template](#input\_worker\_instance\_template) | n/a | `string` | `"ubuntu-focal-server-cloudinit"` | no |
| <a name="input_zerotier_subnet"></a> [zerotier\_subnet](#input\_zerotier\_subnet) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubespray_inventory"></a> [kubespray\_inventory](#output\_kubespray\_inventory) | n/a |
<!-- END_TF_DOCS -->