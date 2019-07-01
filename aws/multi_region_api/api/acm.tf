resource "aws_acm_certificate" "cert" {
  domain_name               = "${var.domain}"
  subject_alternative_names = ["east.${var.domain}", "west.${var.domain}"]
  validation_method         = "DNS"

  tags = {
    product = "monit.systems"
    domain  = "api.monit.systems"
    region  = "${var.name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_0" {
  certificate_arn = "${aws_acm_certificate.cert.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.cert_validation_0.fqdn}",
    "${aws_route53_record.cert_validation_1.fqdn}",
    "${aws_route53_record.cert_validation_2.fqdn}",
  ]
}

# resource "aws_acm_certificate_validation" "cert_1" {
#   certificate_arn         = "${aws_acm_certificate.cert.arn}"
#   validation_record_fqdns = ["${aws_route53_record.cert_validation_1.fqdn}"]
# }


# resource "aws_acm_certificate_validation" "cert_2" {
#   certificate_arn         = "${aws_acm_certificate.cert.arn}"
#   validation_record_fqdns = ["${aws_route53_record.cert_validation_2.fqdn}"]
# }


# resource "aws_acm_certificate_validation" "cert_1" {
#   certificate_arn         = "${aws_acm_certificate.cert.arn}"
#   validation_record_fqdns = ["${var.fqdn_1}"]
# }
# resource "aws_acm_certificate_validation" "cert_2" {
#   certificate_arn         = "${aws_acm_certificate.cert.arn}"
#   validation_record_fqdns = ["${var.fqdn_2}"]
# }

