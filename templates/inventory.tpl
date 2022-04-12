[all]
%{ for index, id in masters-id ~}
${id} ansible_host=${masters-ip[index]} ansible_user=${masters-user} etcd_member_name=etcd-${index} ip=${masters-ip[index]}
%{ endfor ~}
%{ for index, id in workers-id ~}
${id} ansible_host=${workers-ip[index]} ansible_user=${workers-user}
%{ endfor ~}

[bastion]
${bastion-id} ansible_host=${bastion-ip} ansible_user=${bastion-user}

[kube-master]
%{ for index, id in masters-id ~}
${id}
%{ endfor ~}

[etcd]
%{ for index, id in masters-id ~}
${id}
%{ endfor ~}

[kube-node]
%{ for index, id in masters-id ~}
${id}
%{ endfor ~}
%{ for index, id in workers-id ~}
${id}
%{ endfor ~}

[calico_rr]

[k8s-cluster:children]
kube-master
kube-node
calico_rr