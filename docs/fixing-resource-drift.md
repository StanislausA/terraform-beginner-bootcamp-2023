Fix Resource Drift with `terraform import`[^1]
- not all resources support import, review terraform registry documentation

Fix Resource Drift manually with `terraform plan`
- when the state desynchronization is due to a manual(clickOps) action
- `terraform plan -refresh-only` can be used to safely inspect potential state file changes[^2]

[^1]: https://developer.hashicorp.com/terraform/language/import
[^2]: https://developer.hashicorp.com/terraform/tutorials/state/resource-drift#run-a-refresh-only-plan
