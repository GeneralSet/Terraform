# Terraform

setup
```
# https://www.digitalocean.com/docs/api/#HowToGenerateaPersonalAccessToken
export DO_PAT={YOUR_PERSONAL_ACCESS_TOKEN}
```

plan
```
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```

apply
```
terraform appy \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```
