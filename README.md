# terraform-azure-mcaf-naming
Terraform module to generate names according to a convention.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13  |

## Providers

For this module there is no requirement for an external provider.

## Modules

For this module there is no requirement for an external module.

## Resources

| Name                                                                                                                                                              | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudformation_stack.datadog_forwarder](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack)                    | resource    |

## Inputs

| Name                                                                      | Description                                                  | Type                                                                                                                                                                | Default     | Required |
| ------------------------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | :------: |
| <a name="input_format"></a> [format](#input\_format)                      | The naming format used. Current options: E-G-L-S and G-E-L-S | `string`                                                                                                                                                            | `"E-G-L-S"` |    no    |
| <a name="input_namingContext"></a> [namingContext](#input\_namingContext) | n/a                                                          | <pre>object({<br>    workloadShortName = string<br>    environment       = string<br>    applicationName   = string<br>    locationShort     = string<br>    customer_tla      = string<br>  })</pre> | n/a         |   yes    |

## Outputs

| Name                                                                                | Description |
| ----------------------------------------------------------------------------------- | ----------- |
| <a name="output_naming"></a> [naming](#output\_naming)                              | n/a         |
| <a name="output_resource_prefix"></a> [resource\_prefix](#output\_resource\_prefix) | n/a         |
<!-- END_TF_DOCS -->