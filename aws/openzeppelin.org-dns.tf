#resource "aws_route53_zone" "openzeppelin_org" {
#  name = "openzeppelin.org"
#}

#resource "aws_route53_record" "openzeppelin_org_nameservers" {
#  allow_overwrite = true
#  name            = "openzeppelin.org"
#  ttl             = 30
#  type            = "NS"
#  zone_id         = "${aws_route53_zone.openzeppelin_org.zone_id}"
#
#  records = [
#    "${aws_route53_zone.openzeppelin_org.name_servers.0}",
#    "${aws_route53_zone.openzeppelin_org.name_servers.1}",
#    "${aws_route53_zone.openzeppelin_org.name_servers.2}",
#    "${aws_route53_zone.openzeppelin_org.name_servers.3}",
#  ]
#}

#resource "aws_route53_record" "openzeppelin_org_soa" {
#  allow_overwrite = true
#  name            = "openzeppelin.org"
#  ttl             = 900
#  type            = "SOA"
#  zone_id         = "${aws_route53_zone.openzeppelin_org.zone_id}"
#
#  records = [
#    "${aws_route53_zone.openzeppelin_org.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
#  ]
#}

resource "aws_route53_record" "openzeppelin_org_website" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "openzeppelin.org"
  ttl     = "300"
  type    = "A"
  records = [local.netlify_ip]
}

resource "aws_route53_record" "openzeppelin_org_aws_certificate_validation" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "_df0a7bc1a38ac3b6105129ad125344ab.openzeppelin.org"
  ttl     = "300"
  type    = "CNAME"
  records = ["_4314433f11130fc2f99f736864fe12a5.acm-validations.aws."]
}

resource "aws_route53_record" "openzeppelin_org_aws_certificate_validation_www" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "_7c9144567bcc1b51ee510d4338c4ab65.www.openzeppelin.org"
  ttl     = "300"
  type    = "CNAME"
  records = ["_36187d944ae7435d1821e95cbb205186.acm-validations.aws."]
}

resource "aws_route53_record" "openzeppelin_org_google_mx" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "openzeppelin.org"
  ttl     = "300"
  type    = "MX"
  records = [
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "1 aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."
  ]
}

resource "aws_route53_record" "openzeppelin_org_txt" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "openzeppelin.org"
  ttl     = "300"
  type    = "TXT"
  records = [
    "v=spf1 include:mailgun.org include:_spf.google.com ~all",
    "google-site-verification=77Dy8GeDTYpHhvkmjpkIzCTAmlMwQxbas17B20kQNaI"
  ]
}

resource "aws_route53_record" "openzeppelin_org_mailgun_txt_k1" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "k1._domainkey.openzeppelin.org"
  ttl     = "300"
  type    = "TXT"
  records = [
    "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPb/eamwCrd4iA22Er0sMlizpYDTKnnWJtwJtaWFuL4xQrtsOsQWz/2rbuNjzyomdc08IfbRzcU7rDyQh5mf5SqOdsPn7ZnBvJfHgMG2yB4u38nlxBz7hqy1Mq1S0nfELjpjM5A5ck3WW7JbDzmXi402jTrkD09zs3kYtbAnsN2QIDAQAB"
  ]
}

resource "aws_route53_record" "openzeppelin_org_www" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "www.openzeppelin.org"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-org.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_org_docs" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "docs.openzeppelin.org"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-org-docs.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_org_forum" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "forum.openzeppelin.org"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-org-forum.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_org_slack_landing_page" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "slack.openzeppelin.org"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-slack.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_org_cto" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "cto.openzeppelin.org"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-cto.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_org_gns_rinkeby" {
  zone_id = "Z4OXHKVXYGOI"
#  zone_id = "${aws_route53_zone.openzeppelin_org.zone_id}"
  name    = "rinkeby-01.gsn.openzeppelin.org"
  ttl     = 300
  type    = "A"
  records = ["3.80.1.211"]
}