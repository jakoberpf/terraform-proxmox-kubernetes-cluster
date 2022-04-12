module "zerotier_cluster_network" {
  source = "jakoberpf/cluster-network/zerotier"

  name = var.name
  cidr = "${var.zerotier_subnet}/24"
  networks = [
    "external"
  ]
}
