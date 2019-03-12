# Terraform

setup
```
# https://www.digitalocean.com/docs/api/#HowToGenerateaPersonalAccessToken
export DO_PAT={YOUR_PERSONAL_ACCESS_TOKEN}

# https://console.aws.amazon.com/iam/home#/security_credentials
export AWS_ACCESS={YOUR_PERSONAL_ACCESS_KEY}
export AWS_SECRET={YOUR_PERSONAL_SECRET_KEY}

export NS1_APIKEY={ns1_apikey}
```

plan
```
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "aws_access_key=${AWS_ACCESS}" \
  -var "aws_secret_key=${AWS_SECRET}" \
  -var "ns1_apikey=${NS1_APIKEY}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```

apply
```
terraform appy \
  -var "do_token=${DO_PAT}" \
  -var "aws_access_key=${AWS_ACCESS}" \
  -var "aws_secret_key=${AWS_SECRET}" \
  -var "ns1_apikey=${NS1_APIKEY}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```
