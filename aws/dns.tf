provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_route53_record" "slack" {
  zone_id = "Z4OXHKVXYGOI"
  name    = "slack.openzeppelin.org"
  ttl     = 300
  type    = "CNAME"
  records = ["openzeppelin-slack.netlify.com"]
}
