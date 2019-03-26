variable "do_token" {}
variable "do_key_id" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "ns1_apikey" {}

# -- Production
# variable "acme_server_url"          { default = "https://acme.api.letsencrypt.org/directory"}
# variable "acme_registration_email"  { default = "hello@timothy.best" }
# -- Staging
variable "acme_server_url"          { default = "https://acme-staging-v02.api.letsencrypt.org/directory"}
variable "acme_registration_email" { default = "hello@timothy.best" }

provider "digitalocean" {
  token = "${var.do_token}"
}

provider "aws" {
  region = "us-east-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

provider "ns1" {
  apikey = "${var.ns1_apikey}"
}

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}