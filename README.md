# Terraform

setup
```
# https://www.digitalocean.com/docs/api/#HowToGenerateaPersonalAccessToken
export DO_PAT={YOUR_PERSONAL_ACCESS_TOKEN}
# curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_PAT" "https://api.digitalocean.com/v2/account/keys"
export DO_KEY_ID={YOUR_DIGITAL_OCEAN_SHH_KEY_ID}
# assuming we are using ssh key at ~/.ssh/id_rsa
export FINGERPRINT=$(ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub | awk '{print substr($2, 5)}')

# https://console.aws.amazon.com/iam/home#/security_credentials
export AWS_ACCESS={YOUR_PERSONAL_ACCESS_KEY}
export AWS_SECRET={YOUR_PERSONAL_SECRET_KEY}

export NS1_APIKEY={ns1_apikey}
```

plan
```
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "do_key_id=${DO_KEY_ID}" \
  -var "aws_access_key=${AWS_ACCESS}" \
  -var "aws_secret_key=${AWS_SECRET}" \
  -var "ns1_apikey=${NS1_APIKEY}" \
  -var "ssh_fingerprint=${FINGERPRINT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```

apply
```
terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "do_key_id=${DO_KEY_ID}" \
  -var "aws_access_key=${AWS_ACCESS}" \
  -var "aws_secret_key=${AWS_SECRET}" \
  -var "ns1_apikey=${NS1_APIKEY}" \
  -var "ssh_fingerprint=${FINGERPRINT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```
