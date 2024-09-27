# terraform-azure-mcaf-naming
Terraform module to generate names according to a convention.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_region"></a> [azure\_region](#module\_azure\_region) | claranet/regions/azurerm | ~> 7 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | The name of the application | `string` | n/a | yes |
| <a name="input_customer_tla"></a> [customer\_tla](#input\_customer\_tla) | The customer TLA | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the workload is deployed in | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The full name of the location | `string` | n/a | yes |
| <a name="input_workload"></a> [workload](#input\_workload) | The short name of the workload | `string` | n/a | yes |
| <a name="input_format"></a> [format](#input\_format) | The naming format used. Current options: E-G-L-S and G-E-L-S | `string` | `"E-G-L-S"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_naming"></a> [naming](#output\_naming) | n/a |
| <a name="output_resource_prefix"></a> [resource\_prefix](#output\_resource\_prefix) | n/a |
| <a name="output_subscription"></a> [subscription](#output\_subscription) | n/a |
<!-- END_TF_DOCS -->

## License

**Copyright:** Schuberg Philis

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
