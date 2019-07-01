output "kms_alias_arn" {
  value = "${aws_kms_alias.alias.arn}"
}

output "kms_key_arn" {
  value = "${aws_kms_key.key.arn}"
}

output "sns_arn" {
  value = "${aws_sns_topic.topic.arn}"
}

output "sqs_arn" {
  value = "${aws_sqs_queue.queue.arn}"
}

output "sqs_url" {
  value = "${aws_sqs_queue.queue.id}"
}
