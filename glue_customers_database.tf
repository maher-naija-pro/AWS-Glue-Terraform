resource "aws_glue_catalog_database" "glue_customers_database" {
  name = format(
        "%s-%s-customers",
        var.project_name,
        var.platforme_name,
      )

  description = "customers database" 

  location_uri = "s3://maher-glue-test/data/customers_database/"
  
#  parameters   = 

#  target_database {
#  catalog_id 
#  database_name
#
#   } 
#
#  create_table_default_permission {
#    permissions = ["SELECT"]
#
#    principal {
#      data_lake_principal_identifier = "IAM_ALLOWED_PRINCIPALS"
#    }
#  }
}
