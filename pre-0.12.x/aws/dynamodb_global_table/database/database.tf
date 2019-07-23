resource "aws_dynamodb_table" "table" {
  name             = "${var.name}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "${var.hash_key}"
  range_key        = "${var.range_key}"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "${var.hash_key}"
    type = "${var.hash_key_datatype}"
  }

  attribute {
    name = "${var.range_key}"
    type = "${var.range_key_datatype}"
  }

  point_in_time_recovery = {
    enabled = "${var.pitr}"
  }

  server_side_encryption = {
    enabled = "${var.sse}"
  }

  ttl {
    attribute_name = "${var.ttl_attribute}"
    enabled        = "${var.ttl}"
  }

  tags = {
    Name        = "${var.name}"
    Environment = "${var.env}"
    Region      = "${var.region}"
  }
}
