terraform {
  required_version = "> 1.4.0"
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "= 2.1.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "= 4.26.0"
    }
    ansible = {
      source  = "nbering/ansible"
      version = "= 1.0.4"
    }
  }
}
