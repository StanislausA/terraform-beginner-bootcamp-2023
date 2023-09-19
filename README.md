# Terraform Beginner Bootcamp 2023

Notes
---
Terraform Registry:
[registry.terraform.io](https://registry.terraform.io)

Providers:
API abstractions used by Terraform to interact with a platform's exposed resources (GCP, AWS, K8s, etc).

Modules:
Packaged Terraform configurations for commonly used resources/actions.

Resource:
Provider defined infrastructure objects for declaring platform resources and their behaviors.
```terraform
resource "resource_object" "resource_name" {
  # resource object behavior (like length, instance_type) and meta-arguments (depends_on, for_each)
}
```

Output:
Returns infrastructure information for verification or use in other configurations.
