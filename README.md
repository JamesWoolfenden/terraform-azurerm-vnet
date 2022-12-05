# terraform-azurerm-vnet

[![Build Status](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-azurerm-vnet)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-azurerm-vnet.svg)](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-azurerm-vnet.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-azurerm-vnet/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-azurerm-vnet/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-azurerm-vnet&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-azurerm-vnet/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-azurerm-vnet&benchmark=INFRASTRUCTURE+SECURITY)

```terraform
module "networka" {
  source           = "JamesWoolfenden/vnet/azurerm"
  version          = "0.0.24"
  address_prefixes = ["10.2.0.0/16"]
  names            = ["web", "app", "data"]
  vnet = {
    name          = "examplea"
    address_space = ["10.2.0.0/16"]
  }
  rules          = var.rules
  resource_group = azurerm_resource_group.example
  common_tags    = var.common_tags
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
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.client](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_key.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_log_analytics_workspace.examplea](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_network_security_group.examplea](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_watcher.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |
| [azurerm_network_watcher_flow_log.nsg_flow_log](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log) | resource |
| [azurerm_storage_account.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_customer_managed_key.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_customer_managed_key) | resource |
| [azurerm_subnet.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.tfer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | n/a | `list(string)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_names"></a> [names](#input\_names) | n/a | `list(string)` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | n/a | `string` | `"myfirstnsg"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `any` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Rules for NSG | <pre>list(object({<br>    name                       = string,<br>    priority                   = number<br>    direction                  = string,<br>    access                     = string,<br>    protocol                   = string,<br>    source_port_range          = string,<br>    destination_port_range     = string,<br>    source_address_prefix      = string,<br>    destination_address_prefix = string<br>  }))</pre> | n/a | yes |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | n/a | `map` | <pre>{<br>  "address_space": [<br>    "10.0.0.0/24"<br>  ],<br>  "name": "Sandbox"<br>}</pre> | no |
| <a name="input_watcher"></a> [watcher](#input\_watcher) | Watcher group name | `string` | `"acctest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet"></a> [vnet](#output\_vnet) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "azurerm_role_definition" "terraform_pike" {
  role_definition_id = local.uuid
  name               = "terraform_pike"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
    "Microsoft.KeyVault/locations/deletedVaults/read",
    "Microsoft.KeyVault/vaults/delete",
    "Microsoft.KeyVault/vaults/read",
    "Microsoft.KeyVault/vaults/write",
    "Microsoft.Network/applicationGateways/read",
    "Microsoft.Network/connections/read",
    "Microsoft.Network/expressRouteCircuits/read",
    "Microsoft.Network/loadBalancers/read",
    "Microsoft.Network/localNetworkGateways/read",
    "Microsoft.Network/networkInterfaces/read",
    "Microsoft.Network/networkSecurityGroups/delete",
    "Microsoft.Network/networkSecurityGroups/read",
    "Microsoft.Network/networkSecurityGroups/write",
    "Microsoft.Network/networkWatchers/delete",
    "Microsoft.Network/networkWatchers/flowLogs/delete",
    "Microsoft.Network/networkWatchers/flowLogs/read",
    "Microsoft.Network/networkWatchers/flowLogs/write",
    "Microsoft.Network/networkWatchers/read",
    "Microsoft.Network/networkWatchers/write",
    "Microsoft.Network/publicIPAddresses/read",
    "Microsoft.Network/routeTables/read",
    "Microsoft.Network/virtualNetworkGateways/read",
    "Microsoft.Network/virtualNetworks/delete",
    "Microsoft.Network/virtualNetworks/read",
    "Microsoft.Network/virtualNetworks/subnets/delete",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualNetworks/subnets/write",
    "Microsoft.Network/virtualNetworks/write",
    "Microsoft.OperationalInsights/workspaces/delete",
    "Microsoft.OperationalInsights/workspaces/read",
    "Microsoft.OperationalInsights/workspaces/sharedKeys/action",
    "Microsoft.OperationalInsights/workspaces/write",
    "Microsoft.Resources/subscriptions/resourcegroups/read",
    "Microsoft.Storage/storageAccounts/blobServices/read",
    "Microsoft.Storage/storageAccounts/delete",
    "Microsoft.Storage/storageAccounts/fileServices/read",
    "Microsoft.Storage/storageAccounts/listKeys/action",
    "Microsoft.Storage/storageAccounts/read",
    "Microsoft.Storage/storageAccounts/write"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

locals {
  uuid = uuid()
}

data "azurerm_subscription" "primary" {
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

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

Copyright © 2019-2022 James Woolfenden

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
