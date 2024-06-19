resource "aws_budgets_budget" "monthly_budget" {
  name              = "monthly-zero-budget"
  budget_type       = "COST"
  limit_amount      = "0.1"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  cost_types {
    include_credit            = true
    include_discount          = true
    include_other_subscription = true
    include_recurring         = true
    include_refund            = true
    include_subscription      = true
    include_support           = true
    include_tax               = true
    include_upfront           = true
    use_amortized             = false
    use_blended               = false
  }

  time_period_start = "2024-01-01_00:00" 
  
  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = 100 
    threshold_type      = "PERCENTAGE" 
    subscriber_email_addresses = ["atilioruveda17@gmail.com", "lucasconfa7.lc@gmail.com"]
  }
}
