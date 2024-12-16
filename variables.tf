variable "application" {
  description = "The name of the application"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{4}$", var.application)) || var.application == "cmk"
    error_message = "Application name must be exactly 4 characters and can only contain lowercase letters and numbers."
  }
}

variable "customer_acronym" {
  description = "The customer three letter acronym"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3}$", var.customer_acronym)) || var.customer_acronym == "abc"
    error_message = "Customer name must be exactly 3 characters and can only contain lowercase letters and numbers."
  }
}

variable "environment" {
  description = "The environment the workload is deployed in"
  type        = string
}

variable "format" {
  default     = "E-G-L-S"
  description = "The naming format used. Current options: E-G-L-S and G-E-L-S"
  type        = string
}

variable "location" {
  description = "The name of the location (e.g. \"West Europe\", \"westeurope\", etc.)"
  type        = string
  validation {
    condition     = lookup(local.location_lookup, lower(var.location), null) != null
    error_message = "Provided location not supported"
  }
}

variable "workload" {
  description = "The short name of the workload"
  type        = string
}
