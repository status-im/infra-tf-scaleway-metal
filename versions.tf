terraform {
  required_version = "~> 1.1.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "= 2.21.0"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "= 2.1.0"
    }
    ansible = {
      source  = "nbering/ansible"
      version = "= 1.0.4"
    }
  }
}
