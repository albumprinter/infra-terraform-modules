variable "rest_api" {
  description = "REST API that the method should be associated to"
}
variable "resource" {
  description = "Resource that the method should be associated to"
}
variable "http_method" {
  description = "HTTP method that this method should support"
}
variable "authorization" {
  description = "Authorization type that should be used for this method"
  default     = "NONE"
}
variable "authorizer" {
  description = "Authorizer that should be used to authorize calls to this method"
  default     = null
}
variable "lambda_function" {
  description = "The Lambda function that should be integrated with this method"
}
variable "request_validator_id" {
  description = "Request Validator ID that should be used to validate calls to this method"
  default     = null
}
variable "request_parameters" {
  description = "Request parameters supported by this method"
  type        = map
  default     = null
}
variable "request_models" {
  description = "Request models supported by this method"
  type        = map
  default     = null
}
variable "enable_cors" {
  description = "Whether CORS should be enabled or not"
  default     = false
}
