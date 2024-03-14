/* DNS ------------------------------------------*/

variable "cf_zone_id" {
  description = "ID of CloudFlare zone for host record."
  type        = string
  default     = "fd48f427e99bbe1b52105351260690d1"
}

variable "domain" {
  description = "DNS Domain to update"
  type        = string
  default     = "status.im"
}

/* SCALING --------------------------------------*/

variable "zone" {
  description = "Region in which the host reside."
  type        = string
  default     = "fr-par-2"
}

variable "provider_name" {
  description = "Short name of provider being used."
  type        = string
  default     = "sw"
}

variable "type" {
  description = "Type of Scaleway instance to create."
  type        = string
  default     = "GP-BM1-S"
}

variable "host_count" {
  description = "Number of Scaleway instances to create."
  type        = number
}

/* IMAGE ----------------------------------------*/

/* Acquired via API call:
 * https://developers.scaleway.com/en/products/baremetal/api/#get-3e317d
 * The token needs to be passed via X-Auth-Token header. */
variable "os_id" {
  description = "ID of OS image used for instance."
  type        = string
  default     = "03b7f4ba-a6a1-4305-984e-b54fafbf1681"
}

variable "ssh_user" {
  description = "User used for SSH access."
  type        = string
  default     = "root"
}

variable "ssh_key_id" {
  description = "Name of SSH key added to Scaleway."
  type        = string
  default     = "ee3268e1-47bf-42ed-a89e-fefa6d71828b"
}

/* GENERAL --------------------------------------*/

variable "name" {
  description = "Prefix of hostname before index."
  type        = string
  default     = "node"
}

variable "group" {
  description = "Name of Ansible group to add hosts to."
  type        = string
}

variable "env" {
  description = "Environment for these hosts, affects DNS entries."
  type        = string
}

variable "stage" {
  description = "Name of stage, like prod, dev, or staging."
  type        = string
  default     = ""
}
