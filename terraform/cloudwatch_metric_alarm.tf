resource "aws_cloudwatch_metric_alarm" "httpcode_target_5xx_count" {
  alarm_name          = "${var.prefix}alb-tg-${aws_alb_target_group.default.id}-high5XXCount"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  datapoints_to_alarm = "3"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Average API 5XX target group error code count is too high"
  alarm_actions       = [aws_sns_topic.topic.arn]
  #  ok_actions          = var.actions_ok*/

  dimensions = {
    "TargetGroup"  = aws_alb_target_group.default.id
    "LoadBalancer" = aws_alb.default.id
  }
}

resource "aws_cloudwatch_metric_alarm" "httpcode_lb_5xx_count" {
  alarm_name          = "${var.prefix}alb-${aws_alb_target_group.default.id}-high5XXCount"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  datapoints_to_alarm = "3"
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Average API 5XX load balancer error code count is too high"
  alarm_actions       = [aws_sns_topic.topic.arn]
  #  ok_actions          = var.actions_ok

  dimensions = {
    "LoadBalancer" = aws_alb.default.id
  }
}

resource "aws_cloudwatch_metric_alarm" "target_response_time_average" {
  alarm_name          = "${var.prefix}alb-tg-${aws_alb_target_group.default.id}-highResponseTime"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  datapoints_to_alarm = "3"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.response_time_threshold
  alarm_description   = format("Average API response time is greater than %s", var.response_time_threshold)
  alarm_actions       = [aws_sns_topic.topic.arn]
  #  ok_actions          = var.actions_ok

  dimensions = {
    "TargetGroup"  = aws_alb_target_group.default.id
    "LoadBalancer" = aws_alb.default.id
  }
}

resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "${var.prefix}alb-tg-${aws_alb_target_group.default.id}-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  datapoints_to_alarm = "3"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Minimum"
  threshold           = var.unhealthy_hosts_threshold
  alarm_description   = format("Unhealthy host count is greater than %s", var.unhealthy_hosts_threshold)
  alarm_actions       = [aws_sns_topic.topic.arn]
  #  ok_actions          = var.actions_ok

  dimensions = {
    "TargetGroup"  = aws_alb_target_group.default.id
    "LoadBalancer" = aws_alb.default.id
  }
}

resource "aws_cloudwatch_metric_alarm" "healthy_hosts" {
  alarm_name          = "${var.prefix}alb-tg-${aws_alb_target_group.default.id}-healthy-hosts"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_period
  datapoints_to_alarm = "3"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Minimum"
  threshold           = var.healthy_hosts_threshold
  alarm_description   = format("Healthy host count is less than or equal to %s", var.healthy_hosts_threshold)
  alarm_actions       = [aws_sns_topic.topic.arn]
  #  ok_actions          = var.actions_ok

  dimensions = {
    "TargetGroup"  = aws_alb_target_group.default.id
    "LoadBalancer" = aws_alb.default.id
  }
}