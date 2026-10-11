data "oci_data_safe_masking_policy_masking_objects" "data_safe_masking_policy_masking_objects_lookup" {
  for_each = var.data_safe_masking_policy_masking_objects_lookup

  masking_policy_id = each.value.masking_policy_id
  object            = each.value.object
  object_type       = each.value.object_type
  schema_name       = each.value.schema_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

