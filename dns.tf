# Create a new zone
resource "ns1_zone" "tld" {
    zone = "generalset.io"
}

resource "ns1_record" "root" {
    zone   = "${ns1_zone.tld.zone}"
    domain = "${ns1_zone.tld.zone}"
    type   = "ALIAS"
    answers = {
        answer = "${aws_cloudfront_distribution.frontend_cdn.domain_name}"
    }
}
resource "ns1_record" "www" {
    zone   = "${ns1_zone.tld.zone}"
    domain = "www.${ns1_zone.tld.zone}"
    type   = "ALIAS"
    answers = {
        answer = "${aws_s3_bucket.frontend_www.bucket}.${aws_s3_bucket.frontend_www.website_domain}"
    }
}

resource "ns1_record" "multiplayer" {
    zone   = "${ns1_zone.tld.zone}"
    domain = "multiplayer.${ns1_zone.tld.zone}"
    type   = "A"
    answers = {
        answer = "${digitalocean_droplet.multiplayer.ipv4_address}"
    }
}