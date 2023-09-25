Enabling Terraform Cloud
---
- `terraform login`
- in GitPod, quit(q) the terminal overlay
- copy token into user prompt
  - alternative is to create the tfrc.json at terminal specified destination in credentials format[^1]
- add to cloud block as per Cloud Configuration[^2]
- `terraform init` then `terraform apply`

Easier Terraform Cloud initialization[^3]:
---
- Set environment variable: `TF_TOKEN_app_terraform_io="terraform-api-token"`
- `terraform apply`

---
[^1]: https://serverfault.com/a/1067909
[^2]: https://developer.hashicorp.com/terraform/language/settings/terraform-cloud#usage-example
[^3]: https://developer.hashicorp.com/terraform/cli/config/config-file#environment-variable-credentials
