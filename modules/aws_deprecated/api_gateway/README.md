# Module: API Gateway

This module provisions a complete REST API using API Gateway.

## Examples

#### Minimal configuration

```
module "api_gateway" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/api_gateway"

  api_gateway_rest_api_name         = "my_api"
  api_gateway_deployment_stage_name = "dev"
}
```

## Required parameters

The following parameters are considered required.

- [api_gateway_rest_api_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#name)
- [api_gateway_deployment_stage_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#stage_name)

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **api_gateway_rest_api**: contains all attributes available in Terraform for API Gateway REST API resources
- **api_gateway_resource**: contains all attributes available in Terraform for API Gateway Resource resources
- **api_gateway_method**: contains all attributes available in Terraform for API Gateway Method resources
- **api_gateway_method_response**: contains all attributes available in Terraform for API Gateway Method Response resources
- **api_gateway_integration**: contains all attributes available in Terraform for API Gateway Integration resources
- **api_gateway_integration_response**: contains all attributes available in Terraform for API Gateway Integration Response resources
- **api_gateway_deployment**: contains all attributes available in Terraform for API Gateway Deployment resources
- **api_gateway_api_key**: contains all attributes available in Terraform for API Gateway API Key resources
- **api_gateway_usage_plan**: contains all attributes available in Terraform for API Gateway Usage Plan resources
- **api_gateway_usage_plan_key**: contains all attributes available in Terraform for API Gateway Usage Plan Key resources
