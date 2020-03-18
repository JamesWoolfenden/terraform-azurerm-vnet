common_tags = {
"createdby" = "Terraform" }
resource_group = "London_Sandbox_1"
subnet = [{
    address_prefix = "10.0.0.0/27"
    name           = "web"
  },
  {
    address_prefix = "10.0.0.32/27"
    name           = "app"
  },
  {
    address_prefix = "10.0.0.64/27"
    name           = "data"
  }
  ]
