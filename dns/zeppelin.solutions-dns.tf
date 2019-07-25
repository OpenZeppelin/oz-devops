#resource "aws_route53_zone" "zeppelin_solutions" {
#  name = "zeppelin.solutions"
#}

#resource "aws_route53_record" "zeppelin_solutions_nameservers" {
#  allow_overwrite = true
#  name            = "zeppelin.solutions"
#  ttl             = 30
#  type            = "NS"
#  zone_id         = "${aws_route53_zone.zeppelin_solutions.zone_id}"
#
#  records = [
#    "${aws_route53_zone.zeppelin_solutions.name_servers.0}",
#    "${aws_route53_zone.zeppelin_solutions.name_servers.1}",
#    "${aws_route53_zone.zeppelin_solutions.name_servers.2}",
#    "${aws_route53_zone.zeppelin_solutions.name_servers.3}",
#  ]
#}

#resource "aws_route53_record" "zeppelin_solutions_soa" {
#  allow_overwrite = true
#  name            = "zeppelin_solutions"
#  ttl             = 900
#  type            = "SOA"
#  zone_id         = "${aws_route53_zone.zeppelin_solutions.zone_id}"
#
#  records = [
#    "${aws_route53_zone.zeppelin_solutions.name_servers.0}. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
#  ]
#}

resource "aws_route53_record" "zeppelin_solutions_website" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "zeppelin.solutions"
  ttl     = "300"
  type    = "A"
  records = [local.netlify_ip]
}

resource "aws_route53_record" "zeppelin_solutions_website_www" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "www.zeppelin.solutions"
  ttl     = "300"
  type    = "CNAME"
  records = [
    "zeppelinsolutions.netlify.com"
  ]
}

resource "aws_route53_record" "zeppelin_solutions_aws_certificate_validation" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "_a2e6bd1a8031b3138db955e90c650b8a.zeppelin.solutions"
  ttl     = "900"
  type    = "CNAME"
  records = [
    "_7c99b0960e8f0a34f964128607398240.acm-validations.aws."
  ]
}

resource "aws_route53_record" "zeppelin_solutions_amazonses_txt" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "_amazonses.zeppelin.solutions"
  ttl     = "300"
  type    = "TXT"
  records = [
    "+Ax7IYs5hduUVNOXG8vsxg8YMysWBBZEWTQyrXJDlGs="
  ]
}

resource "aws_route53_record" "zeppelin_solutions_google_mx" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "zeppelin.solutions"
  ttl     = "300"
  type    = "MX"
  records = [
    "5	ALT2.ASPMX.L.GOOGLE.COM.",
    "5	ALT1.ASPMX.L.GOOGLE.COM.",
    "1	ASPMX.L.GOOGLE.COM.",
    "10	ALT3.ASPMX.L.GOOGLE.COM.",
    "10	ALT4.ASPMX.L.GOOGLE.COM."
  ]
}

resource "aws_route53_record" "zeppelin_solutions_google_txt" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "zeppelin.solutions"
  ttl     = "900"
  type    = "TXT"
  records = [
    "google-site-verification=2Yn5UhqxucWrImbhsLsnr6NqgsTH6MlfMQ7mqa2KAPE"
  ]
}

resource "aws_route53_record" "zeppelin_solutions_blog_nameservers" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id         = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name            = "blog.zeppelin.solution"
  ttl             = 30
  type            = "NS"

  records = [
    "ns1.wordpress.com.",
    "ns2.wordpress.com.",
    "ns3.wordpress.com."
  ]
}

resource "aws_route53_record" "zeppelin_solutions_blog_comodoca_certificate_validation" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "2c0166b576465e4ac79da93b243892c5.blog.zeppelin.solutions"
  ttl     = "900"
  type    = "CNAME"
  records = [
    "fd23620104c2c5e15b202edead6f97b5d8b3fc50.comodoca.com."
  ]
}

resource "aws_route53_record" "zeppelin_solutions_cloc" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "cloc.zeppelin.solutions"
  ttl     = "300"
  type    = "A"
  records = ["52.200.215.17"]
}

resource "aws_route53_record" "zeppelin_solutions_backoffice" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "backoffice.zeppelin.solutions"
  ttl     = "900"
  type    = "A"
  records = ["52.200.215.17"]
}

resource "aws_route53_record" "zeppelin_solutions_basil" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "basil.zeppelin.solutions"
  ttl     = "900"
  type    = "A"
  records = ["52.200.215.17"]
}

resource "aws_route53_record" "zeppelin_solutions_crafty" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "crafty.zeppelin.solutions"
  type    = "CNAME"
  records = ["zeppelinsolutions-craft.netlify.com"]
}

resource "aws_route53_record" "zeppelin_solutions_ethernaut" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "ethernaut.zeppelin.solutions"
  ttl     = "900"
  type    = "CNAME"
  records = ["openzeppelin-ethernaut.netlify.com"]
}

resource "aws_route53_record" "zeppelin_solutions_ethernaut_devcon3" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "ethernaut-devcon3.zeppelin.solutions"
  ttl     = "900"
  type    = "CNAME"
  records = [
    "openzeppelin-ethernaut.netlify.com"
  ]
}

resource "aws_route53_record" "zeppelin_solutions_ethernaut_ethuoft" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "ethernaut-ethuoft.zeppelin.solutions."
  ttl     = "900"
  type    = "CNAME"
  records = [
    "openzeppelin-ethernaut.netlify.com"
  ]
}

resource "aws_route53_record" "zeppelin_solutions_ethhunt" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "ethhunt.zeppelin.solutions"
  ttl     = "300"
  type    = "A"
  records = ["104.248.61.114"]
}

resource "aws_route53_record" "zeppelin_solutions_forum" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "forum.zeppelin.solutions."
  ttl     = "300"
  type    = "CNAME"
  records = [
    "zeppelinsolutions-forum.netlify.com"
  ]
}

resource "aws_route53_record" "zeppelin_solutions_smackathon_aws_certificate_validation" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = " _49e74f9f75ec162bfc241a2c2164e6eb.smackathon.zeppelin.solutions."
  ttl     = "900"
  type    = "CNAME"
  records = [
    "_e0cf2fe362b9d1d9914cfa5aa190dbf7.acm-validations.aws."
  ]
}

resource "aws_route53_record" "zeppelin_solutions_solmap" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = "solmap.zeppelin.solutions"
  type    = "A"
  alias {
    name                   = "d36gbv29lyto7i.cloudfront.net."
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "zeppelin_solutions_solmap_aws_certificate_validation" {
  zone_id = "ZB15TMR9MWDH7"
#  zone_id = "${aws_route53_zone.zeppelin_solutions.zone_id}"
  name    = " _12b9468873f62de880e9bb4cfc82f941.solmap.zeppelin.solutions."
  ttl     = "300"
  type    = "CNAME"
  records = [
    "_bf186c90aebcb929d554fa0058a1d8ea.acm-validations.aws."
  ]
}
