# Module: API Gateway

This module provisions a complete REST API using API Gateway.

## Examples 

#### Minimal configuration
```
module "api_gateway" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/api_gateway"

  api_gateway_rest_api_name = "my_api"
  
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain
}
```


## Required parameters

The following parameters are considered required.

* [api_gateway_rest_api_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#name)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

* **rest_api**: contains all attributes available in Terraform for API Gateway REST API resources
* **resource**: contains all attributes available in Terraform for API Gateway Resource resources
* **method**: contains all attributes available in Terraform for API Gateway Method resources
* **method_response**: contains all attributes available in Terraform for API Gateway Method Response resources
* **integration**: contains all attributes available in Terraform for API Gateway Integration resources
* **integration_response**: contains all attributes available in Terraform for API Gateway Integration Response resources
* **deployment**: contains all attributes available in Terraform for API Gateway Deployment resources
* **api_key**: contains all attributes available in Terraform for API Gateway API Key resources
* **usage_plan**: contains all attributes available in Terraform for API Gateway Usage Plan resources
* **usage_plan_key**: contains all attributes available in Terraform for API Gateway Usage Plan Key resources