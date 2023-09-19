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

<dt>Convenience Features:</dt>
<dd>Provider auto-resolution when not explicitly defined (not guaranteed).</dd>

<dt>
<code>terraform init</code>
</dt>
<dd>Installs defined providers into the configuration directory (<code>.terraform</code>) and creates <code>.terraform.lock.hcl</code>.</dd>

<dt>
<code>terraform get</code>
</dt>
<dd>Updates an existing configuration directory with all newly defined changes. (terraform init does a similar job but is more comprehensive)</dd>

<dt>
<code>terraform plan</code>
</dt>
<dd>Soft validation of defined infrastructure objects used before <code>terraform apply</code></dd>

<dt>
<code>terraform apply</code>
</dt>
<dd>
Execution of the defined configuration by first using soft validation 
(<code>terraform plan</code>) followed by a user confirmation prompt, 
which can be auto confirmed using <code>--auto-approve</code> flag 
and finally the attempt to create platform resources.
</dd>

<dt>terraform destroy</dt>
<dd>Terminates defined infrastructure objects after user confirmation prompt which cannot be auto confirmed (inverse of <code>terraform apply</code>).</dd>
</dl>
