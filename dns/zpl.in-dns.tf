resource "aws_route53_zone" "zpl_in" {
  name = "zpl.in"
}

resource "aws_route53_record" "zpl_in_nameservers" {
  allow_overwrite = true
  name            = "zpl.in"
  ttl             = 172800
  type            = "NS"
  zone_id         = "${aws_route53_zone.zpl_in.zone_id}"

  records = [
    "${aws_route53_zone.zpl_in.name_servers.0}",
    "${aws_route53_zone.zpl_in.name_servers.1}",
    "${aws_route53_zone.zpl_in.name_servers.2}",
    "${aws_route53_zone.zpl_in.name_servers.3}",
  ]
}

resource "aws_route53_record" "zpl_in_soa" {
  allow_overwrite = true
  name            = "zpl.in"
  ttl             = 900
  type            = "SOA"
  zone_id         = "${aws_route53_zone.zpl_in.zone_id}"

  records = [
    "${aws_route53_zone.zpl_in.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

resource "aws_route53_record" "zpl_in_website" {
  zone_id = "${aws_route53_zone.zpl_in.zone_id}"
  name    = "zpl.in"
  type    = "A"
  alias {
    name                   = "d3vpyoihivlbza.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}
