provider "aws" {
  alias = "east"
}

provider "aws" {
  alias = "west"
}

module "east" {
  source = "./api"
  name   = "east"
  domain = "${var.domain}"

  zone_id = "${var.route_53_zone_id}"

  providers = {
    aws = "aws.east"
  }
}

module "west" {
  source = "./api"
  name   = "west"
  domain = "${var.domain}"

  zone_id = "${var.route_53_zone_id}"

  providers = {
    aws = "aws.west"
  }
}
