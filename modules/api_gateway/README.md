# Module: API Gateway

This module provisions a complete REST API using API Gateway.

## Examples 

#### Minimal configuration
```
module "api_gateway" {
  source = "../api_gateway"

  api_gateway_rest_api_name = "my_api"
  
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain
}
```


## Required parameters

The following parameters are considered required.

* [api_gateway_rest_api_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#name)
* [api_gateway_resource_path_part](https://www.terraform.io/docs/providers/aws/r/api_gateway_resource.html#path_part)
* [api_gateway_integration_type](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#type)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

