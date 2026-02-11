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
}

