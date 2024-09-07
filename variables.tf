variable "CLOUDFLARE_API_TOKEN" {
  type        = string
  description = "API token for Cloudflare provider"
}

variable "zone_id" {
  type        = string
  description = "Zone ID"
}


variable "records" {
  type = list(object({
    name            = string
    type            = string
    value           = string
    ttl             = number
    proxied         = bool
    allow_overwrite = bool
    comment         = string
  }))
  description = "List of DNS records to manage in Cloudflare"
}
