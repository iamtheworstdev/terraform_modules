resource "aws_dynamodb_global_table" "global_table" {
  depends_on = ["module.us-east-1-db", "module.us-west-2-db"]
  provider   = "aws.us-east-1"

  name = "${var.name}"

  replica {
    region_name = "us-east-1"
  }

  replica {
    region_name = "us-west-2"
  }
}
