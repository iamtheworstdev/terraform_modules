resource "aws_sns_topic" "topic" {
  name = "${var.name}"

  sqs_success_feedback_role_arn = "arn:aws:iam::${var.account_id}:role/SNSFeedback"
  sqs_failure_feedback_role_arn = "arn:aws:iam::${var.account_id}:role/SNSFeedback"
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = "${aws_sns_topic.topic.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.queue.arn}"
}
