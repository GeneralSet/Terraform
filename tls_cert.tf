resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = "${tls_private_key.private_key.private_key_pem}"
  email_address   = "${var.acme_registration_email}"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "generalset.io"
  subject_alternative_names = ["www.generalset.io", "multiplayer.generalset.io"]

  dns_challenge {
    provider = "ns1"

    config {
      NS1_API_KEY = "${var.ns1_apikey}"
    }
  }
}