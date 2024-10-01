output "naming" {
  value = local.abbreviations
}

output "resource_prefix" {
  value = local.resourceprefix
}

output "subscription" {
  value = local.subscription
}

output "region_short_name" {
  value = lookup(local.combined_map, var.location, "unknown")
}