resource "aws_glue_crawler" "rds" {
  database_name = aws_glue_catalog_database.glue_customers_database.name
#  schedule      = "cron(0 1 * * ? *)"
  name          =  format(
        "%s-%s-rds",
        var.project_name,
        var.platforme_name,
      )
  role          = "arn:aws:iam::676490323212:role/glue-test"
  jdbc_target {
    connection_name = aws_glue_connection.example.name
    path            = "trustdevdatabaseinstance/%"
   #exclusions 
  }

#dynamodb_target
#jdbc_target 
#s3_target
#mongodb_target
#catalog_target

#tags 
#classifiers 
#configuration
#description
#schema_change_policy
#recrawl_policy
#security_configuration
#table_prefix
}
