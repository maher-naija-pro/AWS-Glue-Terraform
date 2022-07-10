data "aws_db_instance" "my_database" {
   db_instance_identifier = "trustdatadatabase"
}

data "aws_db_subnet_group" "my_database_subnet_group" {
   name = data.aws_db_instance.my_database.db_subnet_group
}

data "aws_subnet" "my_database_subnets" {
   for_each = data.aws_db_subnet_group.my_database_subnet_group.subnet_ids
   id       = each.value
}

resource "aws_glue_connection" "example" {
  connection_properties = {
    JDBC_CONNECTION_URL = "jdbc:postgresql://trustdatadatabase.c4ayxa9saczd.us-east-2.rds.amazonaws.com:3306/trustdevdatabaseinstance"
    PASSWORD            = "cfgtyuhjnmkhgc" 
    USERNAME            = "pepperdev"
  }
 connection_type = "JDBC"
  name = format(
        "%s-%s-customers",
        var.project_name,
        var.platforme_name,
      )

  physical_connection_requirements {
  availability_zone      = data.aws_db_instance.my_database.availability_zone
  security_group_id_list = ["sg-041254320ec36ad83"]
  subnet_id              = [for subnet in data.aws_subnet.my_database_subnets : subnet.id if subnet.availability_zone == data.aws_db_instance.my_database.availability_zone][0]
  }

#catalog_id 
#description
#match_criteria
#tags 

}
