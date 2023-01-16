terraform {
  required_version = "~> 1.3.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "= 3.26.0"
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
