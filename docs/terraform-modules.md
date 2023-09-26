Root Module Structure
---
As per: https://developer.hashicorp.com/terraform/language/modules/develop/structure

```
root/
│
├── main.tf          (primary entrypoint)
├── providers.tf     (defines required providers)
├── outputs.tf       (defines module return values)
├── variables.tf     (defines module input values)
├── terraform.tfvars (defines project scoped values)
└── README.md        (required)
```

Module Creation
---
- Creating Modules[^1]
- General[^2]

Module definition
---
```terraform
module "name" {
  source = "folder_path"
  # can also contain input variables as attributes
}
```

[^1]: https://developer.hashicorp.com/terraform/language/modules/develop
[^2]: https://developer.hashicorp.com/terraform/language/modules
