output "naming" {
  value = local.names
}

output "resource_prefix" {
  value = local.resource_prefix
}

output "location_short_name" {
  value = lookup(local.location_lookup, lower(var.location), "unknown")
}