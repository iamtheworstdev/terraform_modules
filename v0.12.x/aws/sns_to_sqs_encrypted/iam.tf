data "aws_iam_policy_document" "key" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }

    actions   = ["kms:*"]
    resources = ["*"]
  }

  statement {
    sid = "SNSEncrypt"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
  }

  statement {
    sid = "SQSDecrypt"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]

    principals {
      type        = "Service"
      identifiers = ["sqs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "sns_to_sqs" {
  statement {
    sid = "SNStoSQS"

    actions = [
      "sqs:SendMessage",
    ]

    effect = "Allow"

    resources = [
      "${aws_sqs_queue.queue.arn}",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition = {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = ["${aws_sns_topic.topic.arn}"]
    }
  }
}

resource "aws_iam_role" "sns_feedback" {
  name               = "SNSFeedback"
  description        = "SNS Success/Failure Feedback"
  assume_role_policy = "${data.aws_iam_policy_document.sns.json}"
}

data "aws_iam_policy_document" "sns" {
  statement {
    sid    = "SNS"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "sns_feedback" {
  role       = "${aws_iam_role.sns_feedback.name}"
  policy_arn = "${aws_iam_policy.sns_feedback.arn}"
}

resource "aws_iam_policy" "sns_feedback" {
  name   = "SNSFeedback"
  policy = "${data.aws_iam_policy_document.sns_feedback.json}"
}

data "aws_iam_policy_document" "sns_feedback" {
  statement {
    sid = "SNSFeedback"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutMetricFilter",
      "logs:PutRetentionPolicy",
    ]

    effect = "Allow"

    resources = ["*"]
  }
}
