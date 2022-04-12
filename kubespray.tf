locals {
  kubespray_inventory = templatefile("${path.module}/templates/inventory.tpl", {
    masters-ip = [
      "master-0",
      "master-1",
      "master-2"
    ]
    masters-ip-zerotier = [
      "master-0",
      "master-1",
      "master-2"
    ]
    masters-id = [
      "master-0",
      "master-1",
      "master-2"
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
