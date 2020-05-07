resource "aws_route53_zone" "ethbuenosaires_com" {
  name = "ethbuenosaires.com"
}

resource "aws_route53_record" "ethbuenosaires_com_nameservers" {
  allow_overwrite = true
  name            = "ethbuenosaires.com"
  ttl             = 172800
  type            = "NS"
  zone_id         = "${aws_route53_zone.ethbuenosaires_com.zone_id}"

  records = [
    "${aws_route53_zone.ethbuenosaires_com.name_servers.0}",
    "${aws_route53_zone.ethbuenosaires_com.name_servers.1}",
    "${aws_route53_zone.ethbuenosaires_com.name_servers.2}",
    "${aws_route53_zone.ethbuenosaires_com.name_servers.3}",
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_soa" {
  allow_overwrite = true
  name            = "ethbuenosaires.com"
  ttl             = 900
  type            = "SOA"
  zone_id         = "${aws_route53_zone.ethbuenosaires_com.zone_id}"

  records = [
    "${aws_route53_zone.ethbuenosaires_com.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_website" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "ethbuenosaires.com"
  type    = "A"
  alias {
    name                   = "d2pk3xzb2gn027.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "ethbuenosaires_com_aws_certificate_validation" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "_77390243c59ad0decaafe42d49b47230.ethbuenosaires.com."
  ttl     = "300"
  type    = "CNAME"
  records = [
    "_462b64ae1a70a4a39b714e030d08fd47.acm-validations.aws."
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_google_hosted" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "elez3zmpkxat.ethbuenosaires.com."
  ttl     = "300"
  type    = "CNAME"
  records = [
    "gv-2w2eeuakortjvq.dv.googlehosted.com"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_google_mx" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "ethbuenosaires.com"
  ttl     = "3600"
  type    = "MX"
  records = [
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ALT3.ASPMX.L.GOOGLE.COM",
    "10 ALT4.ASPMX.L.GOOGLE.COM"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_google_txt" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "ethbuenosaires.com"
  ttl     = "900"
  type    = "TXT"
  records = [
    "v=spf1 include:_spf.google.com ~all",
    "v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@openzeppelin.com"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_mailgun_mx" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "mg.ethbuenosaires.com"
  ttl     = "300"
  type    = "MX"
  records = [
    "10 mxa.mailgun.org",
    "10 mxb.mailgun.org"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_mailgun_txt" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "mg.ethbuenosaires.com"
  ttl     = "300"
  type    = "TXT"
  records = [
    "v=spf1 include:mailgun.org ~all"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_domainkey_txt" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "pic._domainkey.mg.ethbuenosaires.com"
  ttl     = "300"
  type    = "TXT"
  records = [
    "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQChVf7iQRFumlWyJoTTvpAy140Zb+rLehUJkc8I1jOJH1Hos/mLHJSRD8JrWk1ijU8ZhlUs0c2WpA8u49n0vy8Fru/lT8RabzpBAlpKwuXbyZjEL16aDflRfAEda6wIg0aZnMaWhie+nksonUX/IMDi0ixunHWi7eYsVJWR1d1gWQIDAQAB"
  ]
}

resource "aws_route53_record" "ethbuenosaires_com_email" {
  zone_id = "${aws_route53_zone.ethbuenosaires_com.zone_id}"
  name    = "email.mg.ethbuenosaires.com"
  ttl     = "300"
  type    = "CNAME"
  records = ["mailgun.org"]
}
