locals {
  emails = ["pvt0701@gmail.com"]
}

resource "aws_sns_topic" "topic" {
  name = "user-updates-topic"
}

resource "aws_sns_topic_subscription" "topic_email_subscription" {
  count     = length(local.emails)
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = local.emails[count.index]
}