module "kubernetes_api" {
  source  = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/erpf/caddy-ingress" # "jakoberpf/gateway-ingress/erpf"

  providers = {
    cloudflare = cloudflare
    remote     = remote.gateway
  }

  domains = [
    "api.athena.k8s.erpf.de"
  ]
  host = "10.110.180.110"
  port = 6443
  type = "kubernetes"

  cloudflare_email   = var.cloudflare_email
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_token   = var.cloudflare_token
  cloudflare_record_value = "primary.gateway.dns.erpf.de"
}
