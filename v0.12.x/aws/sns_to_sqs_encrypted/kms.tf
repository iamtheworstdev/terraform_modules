resource "aws_kms_key" "key" {
  description             = "${var.name}"
  deletion_window_in_days = 30

  policy = "${data.aws_iam_policy_document.key.json}"

  tags {
    env = "${var.env}"
  }
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.name}"
  target_key_id = "${aws_kms_key.key.key_id}"
}
