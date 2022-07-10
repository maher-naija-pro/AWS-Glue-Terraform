#export AWS_ACCESS_KEY_ID="anaccesskey"
#export AWS_SECRET_ACCESS_KEY="asecretkey"

# Define aws provider version


# Configure the AWS Provider region

variable "regions" {
  type = list(object({
      REGION_MAIN=string
      REGION_BACKUP=string
  }))
  default = [
    {
      REGION_MAIN="us-east-1"
      REGION_BACKUP="us-east-2"
    },
    {
      REGION_MAIN="us-east-1"
      REGION_BACKUP="us-east-2"
    },
    {
      REGION_MAIN="us-east-2"
      REGION_BACKUP="us-east-1"
    },
    {
      REGION_MAIN="us-east-2"
      REGION_BACKUP="us-east-1"
    }

  ]
}

provider "aws" {
  region = var.regions[local.platform].REGION_MAIN
}

#cloud fornt certificate must be in us-east-1

provider "aws" {
  alias  = "cloud_front_certif"
  region = "us-east-1"
}

provider "aws" {
  alias  = "backup"
  region = var.regions[local.platform].REGION_BACKUP
}
