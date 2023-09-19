# Terraform Beginner Bootcamp 2023

Notes
---

<dl>
  <dt>Terraform Registry:</dt>
  <dd>https://registry.terraform.io</dd>
  <dt>Providers:</dt>
  <dd>API abstractions used by Terraform to interact with a platform's exposed resources (GCP, AWS, K8s, etc).</dd>
  <dt>Modules:</dt>
  <dd>Packaged Terraform configurations for commonly used resources/actions.</dd>
  <dt>Resource:</dt>
  <dd>
    Provider defined infrastructure objects for declaring platform resources and their behaviors.
    <pre>
      <code>
        resource "resource_object" "resource_name" {
          # resource object behavior (like length, instance_type) and meta-arguments (depends_on, for_each)
        }
      </code>
    </pre>
  </dd>
  <dt>Output:</dt>
  <dd>
    Returns infrastructure information for verification or use in other configurations.
    <pre>
      <code>
        output "output_name" {
          value = resource_object.resource_name.resource_member
        }
      </code>
    </pre>
  </dd>
  <dt>
    <code>.terraform</code>:
  </dt>
  <dd>Folder generally containing Terraform cache subdirectories.</dd>
  <dt>
    <code>.terraform.lock.hcl</code>:
  </dt>
  <dd>Terraform lock file for the various items in `.terraform` cache.</dd>
</dl>






