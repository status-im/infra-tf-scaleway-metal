/* DERIVED --------------------------------------*/

locals {
  stage = var.stage != "" ? var.stage : terraform.workspace
  dc    = "${var.provider_name}-${var.zone}"
  sufix = "${local.dc}.${var.env}.${local.stage}"
  /* tags for the dropplet */
  tags        = [local.stage, var.group, var.env]
  tags_sorted = sort(distinct(local.tags))
  /* pre-generated list of hostnames */
  hostnames = [for i in range(1, var.host_count + 1) :
    "${var.name}-${format("%02d", i)}.${local.dc}.${var.env}.${local.stage}"
  ]
}

/* RESOURCES ------------------------------------*/

resource "scaleway_baremetal_server" "host" {
  name = local.hostnames[count.index]
  tags = local.tags_sorted

  /* Scaling */
  os    = var.os_id
  count = var.host_count
  zone  = var.zone
  offer = var.type

  /* SSH access */
  ssh_key_ids = [var.ssh_key_id]

  /* bootstraping access for later Ansible use */
  provisioner "ansible" {
    plays {
      playbook {
        file_path = "${path.cwd}/ansible/bootstrap.yml"
      }

      hosts  = [self.ips[0].address]
      groups = [var.group]

      extra_vars = {
        hostname     = self.name
        ansible_user = var.ssh_user
        data_center  = local.dc
        stage        = local.stage
        env          = var.env
      }
    }
  }
}

/* Entry for Ansible inventory */
resource "ansible_host" "host" {
  inventory_hostname = local.hostnames[count.index]
  groups             = [var.group, local.dc]
  count              = length(scaleway_baremetal_server.host)
  vars = {
    ansible_host = scaleway_baremetal_server.host[count.index].ips[0].address
    hostname     = local.hostnames[count.index]
    region       = var.zone
    dns_domain   = var.domain
    dns_entry    = "${local.hostnames[count.index]}.${var.domain}"
    data_center  = local.dc
    stage        = local.stage
    env          = var.env
  }
}

resource "cloudflare_record" "host" {
  zone_id = var.zone_id
  count   = length(scaleway_baremetal_server.host)
  name    = element(ansible_host.host.*.vars.hostname, count.index)
  value   = element(ansible_host.host.*.vars.ansible_host, count.index)
  type    = "A"
}
