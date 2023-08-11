terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.8.0"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.4"
    }
    remote = {
      configuration_aliases = [ remote.gateway ]
      source  = "tenstad/remote"
      version = "0.1.2"
    }
    zerotier = {
      source  = "zerotier/zerotier"
      version = "1.2.0"
    }
  }
}
