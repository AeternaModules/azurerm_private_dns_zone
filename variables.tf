variable "private_dns_zones" {
  description = <<EOT
Map of private_dns_zones, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - tags
    - soa_record (block):
        - email (required)
        - expire_time (optional)
        - minimum_ttl (optional)
        - refresh_time (optional)
        - retry_time (optional)
        - tags (optional)
        - ttl (optional)
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    soa_record = optional(object({
      email        = string
      expire_time  = optional(number)
      minimum_ttl  = optional(number)
      refresh_time = optional(number)
      retry_time   = optional(number)
      tags         = optional(map(string))
      ttl          = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.soa_record == null || (length(v.soa_record.email) != 0)
      )
    ])
    error_message = "[from validate.PrivateDnsZoneSOARecordEmail: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.soa_record == null || (v.soa_record.expire_time == null || (v.soa_record.expire_time >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.soa_record == null || (v.soa_record.minimum_ttl == null || (v.soa_record.minimum_ttl >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.soa_record == null || (v.soa_record.refresh_time == null || (v.soa_record.refresh_time >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.soa_record == null || (v.soa_record.retry_time == null || (v.soa_record.retry_time >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.soa_record == null || (v.soa_record.tags == null || (length(v.soa_record.tags) <= 50))
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zones : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

