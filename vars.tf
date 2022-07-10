############################################
######## var for global platforme #########
###########################################

# platforme_name  var
variable "platforme_name" {
   type = string
   description = "platforme_name to tag resources"
   default = "test"
}

locals {
  platform = index(["prod", "dev","data","test"], var.platforme_name)
}


#  keypair_path var
#variable "aws_key_pair" {}
#variable "AWS_ACCESS_KEY_ID" {}
#variable "AWS_SECRET_ACCESS_KEY" {}
#
variable "keypair_path" {
   type = string
   description = "keypair_path"
   default = "/Users/maher.naija/.ssh/trust_ssh.pub"
}

 variable "region" {
    type = string
    default = "us-east-2"
 }

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     =  ["us-east-1a", "us-east-1b", "us-east-1c"]
}



# project_name  var

variable "project_name" {
   type = string
   description = "project_name to tag resources"
   default = "trust"
}

