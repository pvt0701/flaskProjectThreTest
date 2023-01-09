resource "aws_cloudwatch_metric_alarm" "webserver_cpu" {
  alarm_name          = "MyApp-CPUUtilization"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  evaluation_periods  = "5"
  datapoints_to_alarm = "3"
  statistic           = "Average"
  threshold           = "80"
  ok_actions          = [aws_sns_topic.topic.arn]
  dimensions          = {
    InstanceId = "i-0643f14629c31556a"
  }
}