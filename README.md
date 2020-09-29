# terraform-azurerm-vnet

[![Build Status](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-azurerm-vnet)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-azurerm-vnet.svg)](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

```terraform
module "vnet" {
  source                   = "JamesWoolfenden/vnet/azure"
  version                  = "0.2.0"
  resource_group = var.resource_group
  common_tags              = var.common_tags
}
```

This module implements the common_tags scheme. In the the example implementation **examplea.auto.tfvars** you'll find a basic map described:

```HCL
common_tags = {
  environment = "Production"
}
```

Expand on these values to tag all your tagable resources.

This module should be run before nearly anything else as it sets up the remote state store. To do this it needs to be run twice. The first time to create the storage and also its own remote state file.
The second run pushes its own state to the state store.

---

This project is 100% Open Source and licensed under the [APACHE2](LICENSE).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | n/a     |

## Inputs

| Name           | Description                                        | Type                                                                                                                                                                                                                                                                                           | Default                                                                                                | Required |
| -------------- | -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | :------: |
| common_tags    | This is to help you add tags to your cloud objects | `map`                                                                                                                                                                                                                                                                                          | n/a                                                                                                    |   yes    |
| location       | n/a                                                | `string`                                                                                                                                                                                                                                                                                       | `"uksouth"`                                                                                            |    no    |
| nsg_name       | n/a                                                | `string`                                                                                                                                                                                                                                                                                       | `"myfirstnsg"`                                                                                         |    no    |
| resource_group | n/a                                                | `string`                                                                                                                                                                                                                                                                                       | n/a                                                                                                    |   yes    |
| rules          | Rules for NSG                                      | <pre>list(object({<br> name = string,<br> priority = number<br> direction = string,<br> access = string,<br> protocol = string,<br> source_port_range = string,<br> destination_port_range = string,<br> source_address_prefix = string,<br> destination_address_prefix = string<br> }))</pre> | n/a                                                                                                    |   yes    |
| subnet         | n/a                                                | `list`                                                                                                                                                                                                                                                                                         | <pre>[<br> {<br> "address_prefixes": [<br> "10.0.0.0/27"<br> ],<br> "name": "default"<br> }<br>]</pre> |    no    |
| vnet           | n/a                                                | `map`                                                                                                                                                                                                                                                                                          | <pre>{<br> "address_space": [<br> "10.0.0.0/24"<br> ],<br> "name": "Sandbox"<br>}</pre>                |    no    |

## Outputs

| Name | Description |
| ---- | ----------- |
| vnet | n/a         |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

## References

For additional context, refer to some of these links.

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2020 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-azurerm-vnet&url=https://github.com/JamesWoolfenden/terraform-azurerm-vnet
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-azurerm-vnet&url=https://github.com/JamesWoolfenden/terraform-azurerm-vnet
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-azurerm-vnet
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-azurerm-vnet
[share_email]: mailto:?subject=terraform-azurerm-vnet&body=https://github.com/JamesWoolfenden/terraform-azurerm-vnet
