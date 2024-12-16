terraform {
  required_version = ">= 0.13"
}

module "azure_naming" {
  source = "../.."

  customer_acronym = "abc"
  environment      = "t01"
  application      = "dtwh"
  location         = "West Europe"
  workload         = "shrd"
}

output "naming_convention" {
  value = module.azure_naming
}
