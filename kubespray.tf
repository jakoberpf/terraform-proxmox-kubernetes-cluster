locals {
  kubespray_inventory = templatefile("${path.module}/templates/inventory.tpl", {
    masters-id = [
      module.masters[0].name,
      module.masters[1].name,
      module.masters[2].name
    ]
    masters-ip = [
      module.masters[0].ip,
      module.masters[1].ip,
      module.masters[2].ip
    ]
    masters-ip-zerotier = [
      module.masters[0].ip_zerotier,
      module.masters[1].ip_zerotier,
      module.masters[2].ip_zerotier
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
