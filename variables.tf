variable "storage_default_object_access_controls" {
  description = <<EOT
Map of storage_default_object_access_controls, attributes below
Required:
    - bucket
    - entity
    - role
Optional:
    - deletion_policy
    - object
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    bucket          = string
    entity          = string
    role            = string
    deletion_policy = optional(string)
    object          = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

