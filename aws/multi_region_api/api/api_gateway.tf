resource "aws_api_gateway_domain_name" "api" {
  domain_name              = "${var.domain}"
  regional_certificate_arn = "${aws_acm_certificate_validation.cert_0.certificate_arn}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
