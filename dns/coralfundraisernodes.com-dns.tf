resource "aws_route53_zone" "coralfundraisernodes_com" {
  name = "coralfundraisernodes.com"
}

resource "aws_route53_record" "coralfundraisernodes_com_nameservers" {
  allow_overwrite = true
  name            = "coralfundraisernodes.com"
  ttl             = 172800
  type            = "NS"
  zone_id         = "${aws_route53_zone.coralfundraisernodes_com.zone_id}"

  records = [
    "${aws_route53_zone.coralfundraisernodes_com.name_servers.0}",
    "${aws_route53_zone.coralfundraisernodes_com.name_servers.1}",
    "${aws_route53_zone.coralfundraisernodes_com.name_servers.2}",
    "${aws_route53_zone.coralfundraisernodes_com.name_servers.3}",
  ]
}

resource "aws_route53_record" "coralfundraisernodes_com_soa" {
  allow_overwrite = true
  name            = "coralfundraisernodes.com"
  ttl             = 900
  type            = "SOA"
  zone_id         = "${aws_route53_zone.coralfundraisernodes_com.zone_id}"

  records = [
    "${aws_route53_zone.coralfundraisernodes_com.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}
