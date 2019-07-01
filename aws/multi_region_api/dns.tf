resource "aws_route53_record" "balanced-east" {
  zone_id        = "${var.zone_id}"
  name           = "${var.domain}"
  type           = "CNAME"
  ttl            = "60"
  set_identifier = "east.${var.domain}"

  # health_check_id = "${element(aws_route53_health_check.health.*.id, count.index)}"

  records = [
    "east.${var.domain}",
  ]
  latency_routing_policy {
    region = "us-east-1"
  }
}

resource "aws_route53_record" "balanced-west" {
  zone_id        = "${var.zone_id}"
  name           = "${var.domain}"
  type           = "CNAME"
  ttl            = "60"
  set_identifier = "west.${var.domain}"

  # health_check_id = "${element(aws_route53_health_check.health.*.id, count.index)}"

  records = [
    "west.${var.domain}",
  ]
  latency_routing_policy {
    region = "us-west-2"
  }
}
