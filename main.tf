resource "cloudflare_record" "dns" {
  for_each = { for item in var.records : item.name => item }

  zone_id         = var.zone_id
  name            = each.value.name
  type            = each.value.type
  content         = each.value.value
  ttl             = each.value.ttl
  proxied         = each.value.proxied
  allow_overwrite = each.value.allow_overwrite
  comment         = each.value.comment
}
