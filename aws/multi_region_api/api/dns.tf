resource "aws_route53_record" "cert_validation_0" {
  name    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
  zone_id = "${var.zone_id}"
  records = ["${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}"]
  ttl     = 60

  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_1" {
  name    = "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.1.resource_record_type}"
  zone_id = "${var.zone_id}"
  records = ["${aws_acm_certificate.cert.domain_validation_options.1.resource_record_value}"]
  ttl     = 60

  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_2" {
  name    = "${aws_acm_certificate.cert.domain_validation_options.2.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.2.resource_record_type}"
  zone_id = "${var.zone_id}"
  records = ["${aws_acm_certificate.cert.domain_validation_options.2.resource_record_value}"]
  ttl     = 60

  allow_overwrite = true
}

resource "aws_route53_record" "regional" {
  zone_id = "${var.zone_id}"
  name    = "${var.name}.${var.domain}" # e.g. api-eu.example.com
  type    = "A"

  alias {
    name                   = "${aws_api_gateway_domain_name.api.regional_domain_name}"
    zone_id                = "${aws_api_gateway_domain_name.api.regional_zone_id}"
    evaluate_target_health = true
  }
}
