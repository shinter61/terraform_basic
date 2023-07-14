resource "datadog_monitor" "main" {
  name = "sre-onboarding-shinta-b7-metrics-monitor"
  type = "metric alert"

  query = "avg(last_5m):avg:system.cpu.user{host:ip-10-0-1-23.ap-northeast-1.compute.internal} by {host} > 4"

  message = "Alert!!!!!!"

  monitor_thresholds {
    warning = 2
    critical = 4
  }
}
