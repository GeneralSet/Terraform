variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ns1_apikey" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

provider "aws" {
  region = "us-west-2"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

provider "ns1" {
  apikey = "${var.ns1_apikey}"
}