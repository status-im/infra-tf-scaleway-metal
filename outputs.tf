locals {
  public_ips = scaleway_baremetal_server.host[*].ips[0].address
  out_hostnames  = scaleway_baremetal_server.host[*].name
}

output "public_ips" {
  value = local.public_ips
}

output "hostnames" {
  value = local.out_hostnames
}

output "hosts" {
  value = zipmap(local.out_hostnames, local.public_ips)
}
