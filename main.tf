resource "google_storage_default_object_access_control" "storage_default_object_access_controls" {
  for_each = var.storage_default_object_access_controls

  bucket          = each.value.bucket
  entity          = each.value.entity
  role            = each.value.role
  deletion_policy = each.value.deletion_policy
  object          = each.value.object

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

