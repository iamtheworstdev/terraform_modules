resource "aws_sqs_queue" "queue" {
  name                      = "${var.name}"
  delay_seconds             = 15
  max_message_size          = 262144
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 0

  # redrive_policy                    = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.terraform_queue_deadletter.arn}\",\"maxReceiveCount\":4}"
  kms_master_key_id                 = "${aws_kms_alias.alias.arn}"
  kms_data_key_reuse_period_seconds = 86400

  tags {
    env = "${var.env}"
  }
}

resource "aws_sqs_queue_policy" "policy" {
  queue_url = "${aws_sqs_queue.queue.id}"

  policy = "${data.aws_iam_policy_document.sns_to_sqs.json}"
}
