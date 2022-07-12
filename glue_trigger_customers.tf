resource "aws_glue_trigger" "customers" {
  name = format(
        "%s-%s-customers",
        var.project_name,
        var.platforme_name,
      )
#description = ""
enabled = "true"
#workflow_name = ""
#event_batching_condition {
#  batch_size = ""
#  batch_window =""
#} 

#SCHEDULED and CONDITIONAL triggers when created. True is not supported for ON_DEMAND triggers.""
#start_on_creation = "true"


# type = "CONDITIONAL" # "ON_DEMAND"  "SCHEDULED"
  schedule = "cron(15 12 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.customers.name
#arguments
#timeout
#security_configuration
#            notification_property {
#notify_delay_after
#            } 
#or#    crawler_name = aws_glue_crawler.example1.name
  }

#  predicate {
#logical
#    conditions {
#      crawler_name = aws_glue_crawler.example2.name
#      crawl_state  = "SUCCEEDED"
#logical_operator
#    }

#    conditions {
#      job_name = aws_glue_job.example2.name
#      state    = "SUCCEEDED"
#logical_operator
#    }
#  }
#tags

}
