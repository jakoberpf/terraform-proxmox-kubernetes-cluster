terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.14.0"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.4"
    }
    remote = {
      configuration_aliases = [ remote.gateway ]
      source  = "tenstad/remote"
      version = "0.0.23"
    }
    zerotier = {
      source  = "zerotier/zerotier"
      version = "1.2.0"
    }
  }
}
