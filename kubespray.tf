locals {
  kubespray_inventory = templatefile("${path.module}/templates/inventory.tpl", {
    masters-user        = "kubespray"
    masters-id          = [for master in module.masters : "${master.name}"]
    masters-ip          = [for master in module.masters : "${master.ip}"]
    masters-ip-zerotier = [for master in module.masters : "${master.ip_zerotier}"]
    workers-user        = "kubespray"
    workers-id          = var.count_workers != 0 ? [for worker in module.workers : "${worker.name}"] : []
    workers-ip          = var.count_workers != 0 ? [for worker in module.workers : "${worker.ip}"] : []
    bastion-user        = "root"
    bastion-ip          = "bastion"
    bastion-id          = "bastion"
  })
}
