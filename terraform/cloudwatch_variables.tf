
variable "prefix" {
  type        = string
  default     = "alb"
  description = "Alarm Name Prefix"
}

variable "response_time_threshold" {
  type        = string
  default     = "80"
  description = "The average number of milliseconds that requests should complete within."
}

variable "unhealthy_hosts_threshold" {
  type        = string
  default     = "0"
  description = "The number of unhealthy hosts."
}

variable "healthy_hosts_threshold" {
  type        = string
  default     = "1"
  description = "The number of healthy hosts."
}

variable "evaluation_period" {
  type        = string
  default     = "5"
  description = "The evaluation period over which to use when triggering alarms."
}

variable "statistic_period" {
  type        = string
  default     = "120"
  description = "The number of seconds that make each statistic period."
}
