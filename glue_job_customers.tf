resource "aws_glue_job" "customers" {
  name     = format(
        "%s-%s-customers",
        var.project_name,
        var.platforme_name,
      )
  worker_type = "G.2X"
  glue_version = "3.0"
#  role_arn = aws_iam_role.glue.arn
  role_arn = "arn:aws:iam::676490323212:role/glue-test"
  max_retries = 3

  command {
    name = "glueetl"
    script_location = "s3://maher-glue-test/scripts/job_customer_release.py"
  }

 default_arguments = {
    # ... potentially other arguments ...
    "--class"                            = "GlueApp"
    "--job-bookmark-option"              = "job-bookmark-enable"
    "--job-language"                     = "python3"
    "--continuous-log-logGroup"          = aws_cloudwatch_log_group.glue_customers.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = ""
    "--TempDir"                          = "s3-path-to-directory"
    "--enable-job-insights"              = "true"
    "--continuous-log-logStreamPrefix"   = "customers"
    "--enable-spark-ui"                  = "true"
    "--spark-event-logs-path"            = "s3://maher-glue-test/temp-dir/" 
    "--enable-auto-scaling"              = "true"
#    "--extra-py-files"                  = "" 
  }
#non_overridable_arguments 
#description 
#execution_property {
#  max_concurrent_runs = 
#}

#glue_version 
#max_capacity
#notification_property{
#  notify_delay_after
#}
#tags
#timeout
#security_configuration

number_of_workers = 2

}

resource "aws_cloudwatch_log_group" "glue_customers" {
  name              = format(
        "%s-%s-customers",
        var.project_name,
        var.platforme_name,
      )
  retention_in_days = 14
}

