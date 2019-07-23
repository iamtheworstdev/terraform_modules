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

  env                = "${var.env}"
  hash_key           = "${var.hash_key}"
  hash_key_datatype  = "${var.hash_key_datatype}"
  name               = "${var.name}"
  pitr               = "${var.pitr}"
  range_key          = "${var.range_key}"
  range_key_datatype = "${var.range_key_datatype}"
  region             = "${var.region}"
  sse                = "${var.sse}"
  ttl                = "${var.ttl}"
  ttl_attribute      = "${var.ttl_attribute}"
}

module "us-west-2-db" {
  source = "./database"

  providers = {
    aws = "aws.us-west-2"
  }

  env                = "${var.env}"
  hash_key           = "${var.hash_key}"
  hash_key_datatype  = "${var.hash_key_datatype}"
  name               = "${var.name}"
  pitr               = "${var.pitr}"
  range_key          = "${var.range_key}"
  range_key_datatype = "${var.range_key_datatype}"
  region             = "${var.region}"
  sse                = "${var.sse}"
  ttl                = "${var.ttl}"
  ttl_attribute      = "${var.ttl_attribute}"
}
