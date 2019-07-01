provider "aws" {
  alias = "us-east-1"
}

provider "aws" {
  alias = "us-west-2"
}

module "us-east-1-db" {
  source = "./database"

  providers = {
    aws = "aws.us-east-1"
  }

  env               = "${var.env}"
  hashkey           = "${var.hashkey}"
  hashkey_datatype  = "${var.hashkey_datatype}"
  name              = "${var.name}"
  rangekey          = "${var.rangekey}"
  rangekey_datatype = "${var.rangekey_datatype}"
}

module "us-west-2-db" {
  source = "./database"

  providers = {
    aws = "aws.us-west-2"
  }

  env               = "${var.env}"
  hashkey           = "${var.hashkey}"
  hashkey_datatype  = "${var.hashkey_datatype}"
  name              = "${var.name}"
  rangekey          = "${var.rangekey}"
  rangekey_datatype = "${var.rangekey_datatype}"
}
