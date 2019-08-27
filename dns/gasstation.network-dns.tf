resource "aws_route53_zone" "gasstation_network" {
  name = "gasstation.network"
}

resource "aws_route53_record" "gassstation_network_nameservers" {
  allow_overwrite = true
  name            = "gasstation.network"
  ttl             = 30
  type            = "NS"
  zone_id         = "${aws_route53_zone.gasstation_network.zone_id}"

  records = [
    "${aws_route53_zone.gasstation_network.name_servers.0}",
    "${aws_route53_zone.gasstation_network.name_servers.1}",
    "${aws_route53_zone.gasstation_network.name_servers.2}",
    "${aws_route53_zone.gasstation_network.name_servers.3}",
  ]
}

resource "aws_route53_record" "gasstation_network_soa" {
  allow_overwrite = true
  name            = "gasstation.network"
  ttl             = 900
  type            = "SOA"
  zone_id         = "${aws_route53_zone.gasstation_network.zone_id}"

  records = [
    "${aws_route53_zone.gasstation_network.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

resource "aws_route53_record" "gasstation_network_website" {
  zone_id = "${aws_route53_zone.gasstation_network.zone_id}"
  name    = "gasstation.network"
  ttl     = "300"
  type    = "A"
  records = [local.netlify_ip]
}

resource "aws_route53_record" "gasstation_network_www" {
  zone_id = "${aws_route53_zone.gasstation_network.zone_id}"
  name    = "www.gasstation.network"
  ttl     = 300
  type    = "CNAME"
  records = ["gifted-mayer-c163b8.netlify.com"]
}
