# Description

This is a helper module used by Status internal repos like: [infra-ci](https://github.com/status-im/infra-ci)

It allows for deploying [bare metal](https://www.scaleway.com/en/bare-metal-servers/) servers on [Scaleway](https://www.scaleway.com/).

# Usage

Simply import the module using the `source` directive:
```hcl
module "scaleway-bare-metal" {
  source = "github.com/status-im/infra-tf-scaleway-metal"
}
```

[More details.](https://www.terraform.io/docs/modules/sources.html#github)

# Variables

* __Scaling__
  * `host_count` - Number of hosts to start in this region.
  * `os_id` - ID of OS image used to create host. (default: `d859aa89-8b4a-4551-af42-ff7c0c27260a`)
  * `type` - Type of host to create. (default: `GP-BM1-S`)
  * `zone` - Zone in which the server will be created. (default: `fr-par-2`)
* __General__
  * `name` - Prefix of hostname before index. (default: `node`)
  * `group` - Name of Ansible group to add hosts to.
  * `env` - Environment for these hosts, affects DNS entries.
  * `domain` - DNS Domain to update.
* __Security__
  * `ssh_user` - Name of SSH user for first login. (default: `root`)
  * `ssh_key_id` - ID of SSH key uploaded to Scaleway.

# Known Issues

Currently the `scaleway_baremetal_server` resource does not support;

* Configuring floating IPs with `ip_id` setting
* Configuring firewall rules with `security_group_id` setting

It also appears to be only available in the `fr-par-2` zone.
