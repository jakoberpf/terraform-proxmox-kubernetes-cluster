locals {
  kubespray_inventory = templatefile("${path.module}/templates/inventory.tpl", {
    masters-id = [
      module.kubernetes_node_0[0].name,
      module.kubernetes_node_0[1].name,
      module.kubernetes_node_0[2].name
    ]
    masters-ip = [
      module.kubernetes_node_0[0].ip,
      module.kubernetes_node_0[1].ip,
      module.kubernetes_node_0[2].ip
    ]
    masters-ip-zerotier = [
      module.kubernetes_node_0[0].ip_zerotier,
      module.kubernetes_node_0[1].ip_zerotier,
      module.kubernetes_node_0[2].ip_zerotier
    ]
    masters-user = "kubespray"
    workers-ip = [
      "worker-0",
      "worker-1",
      "worker-2"
    ]
    workers-id = [
      "worker-0",
      "worker-1",
      "worker-2"
    ]
    workers-user = "kubespray"
    bastion-ip   = "bastion"
    bastion-id   = "bastion"
    bastion-user = "root"
  })
}
