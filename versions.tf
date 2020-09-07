terraform {
  required_version = ">= 0.13"
  required_providers {
    cloudflare = {
      source  = "terraform-providers/cloudflare"
      version = "= 2.3.0"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "= 1.16.0"
    }
    ansible = {
      source  = "nbering/ansible"
      version = "= 1.0.4"
    }
  }
}
