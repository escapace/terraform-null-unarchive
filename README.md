<!-- BEGIN_TF_DOCS -->

## Inputs

| Name    | Description  | Type     | Default | Required |
| ------- | ------------ | -------- | ------- | :------: |
| archive | Archive path | `string` | n/a     |   yes    |

## Outputs

| Name | Description            |
| ---- | ---------------------- |
| path | Extracted archive path |

## Resources

| Name                                                                                                           | Type     |
| -------------------------------------------------------------------------------------------------------------- | -------- |
| [null_resource.archive](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >=1.9.8 |
| null      | >=3.2.3 |

<!-- END_TF_DOCS -->
