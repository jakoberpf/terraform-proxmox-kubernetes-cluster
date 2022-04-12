module "zerotier_cluster_network" {
  source = "jakoberpf/cluster-network/zerotier"

  name = var.name
  cidr = "10.110.180.0/24"
  networks = [
    "external"
  ]
}
