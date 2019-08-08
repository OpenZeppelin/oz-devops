terraform {
  backend "s3" {
    bucket  = "terraform.openzeppelin.com"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
