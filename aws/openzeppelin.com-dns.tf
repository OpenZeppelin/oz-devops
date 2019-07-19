resource "aws_route53_zone" "openzeppelin_com" {
  name = "openzeppelin.com"
}

resource "aws_route53_record" "openzeppelin_com_nameservers" {
  allow_overwrite = true
  name            = "openzeppelin.com"
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.openzeppelin_com.zone_id}"

  records = [
    "${aws_route53_zone.openzeppelin_com.name_servers.0}",
    "${aws_route53_zone.openzeppelin_com.name_servers.1}",
    "${aws_route53_zone.openzeppelin_com.name_servers.2}",
    "${aws_route53_zone.openzeppelin_com.name_servers.3}",
  ]
}

resource "aws_route53_record" "openzeppelin_com_soa" {
  allow_overwrite = true
  name            = "openzeppelin.com"
  ttl             = 900
  type            = "SOA"
  zone_id         = "${aws_route53_zone.openzeppelin_com.zone_id}"

  records = [
    "${aws_route53_zone.openzeppelin_com.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

resource "aws_route53_record" "openzeppelin_com_website" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "openzeppelin.com"
  ttl     = "300"
  type    = "A"
  records = [local.netlify_ip]
}

resource "aws_route53_record" "openzeppelin_com_www" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "www.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin.netlify.com"]
}

resource "aws_route53_record" "openzeppelin_com_google_mx" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "openzeppelin.com"
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

resource "aws_route53_record" "openzeppelin_com_txt" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "openzeppelin.com"
  ttl     = "300"
  type    = "TXT"
  records = [
    "v=spf1 include:_spf.google.com ~all",
    "google-site-verification=30do8MGZ29CQX6R0H5hs3Y09SUYuLIt1fbrHWBeJg98"
  ]
}

resource "aws_route53_record" "openzeppelin_com_docs" {
  zone_id = "${aws_route53_zone.openzeppelin_com.zone_id}"
  name    = "docs.openzeppelin.com"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-docs.netlify.com"]
}
