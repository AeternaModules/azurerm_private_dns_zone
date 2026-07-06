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
      expire_time  = optional(number) # Default: 2419200
      minimum_ttl  = optional(number) # Default: 10
      refresh_time = optional(number) # Default: 3600
      retry_time   = optional(number) # Default: 300
      tags         = optional(map(string))
      ttl          = optional(number) # Default: 3600
    }))
  }))
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
  # --- Unconfirmed validation candidates, derived from azurerm_private_dns_zone's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: soa_record.email
  #   condition: length(value) != 0
  #   message:   [from validate.PrivateDnsZoneSOARecordEmail: invalid when len(value) == 0]
  #   source:    [from validate.PrivateDnsZoneSOARecordEmail: invalid when len(value) == 0]
  # path: soa_record.email
  #   source:    [from validate.PrivateDnsZoneSOARecordEmail] len(vSegments) < 2 || len(vSegments) > 34
  # path: soa_record.email
  #   condition: length(value) > 0
  #   message:   [from validate.PrivateDnsZoneSOARecordEmail: invalid when value == ""]
  #   source:    [from validate.PrivateDnsZoneSOARecordEmail: invalid when value == ""]
  # path: soa_record.email
  #   condition: length(value) <= 63
  #   message:   [from validate.PrivateDnsZoneSOARecordEmail: invalid when len(value) > 63]
  #   source:    [from validate.PrivateDnsZoneSOARecordEmail: invalid when len(value) > 63]
  # path: soa_record.email
  #   source:    [from validate.PrivateDnsZoneSOARecordEmail] !regexp.MustCompile(`^[a-zA-Z\d._-]+$`).MatchString(value)
  # path: soa_record.ttl
  #   source:    validation.IntBetween(0, math.MaxInt32) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
  # path: soa_record.tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: soa_record.tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: soa_record.tags
  #   source:    [from tags.Validate] err != nil
  # path: soa_record.tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

