# Module: Security Group - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### Security Group

- [name](https://www.terraform.io/docs/providers/aws/r/security_group.html#name)
- [name_prefix](https://www.terraform.io/docs/providers/aws/r/security_group.html#name_prefix)
- [description](https://www.terraform.io/docs/providers/aws/r/security_group.html#description)
- [revoke_rules_on_delete](https://www.terraform.io/docs/providers/aws/r/security_group.html#revoke_rules_on_delete)
- [vpc_id](https://www.terraform.io/docs/providers/aws/r/security_group.html#vpc_id)
- [ingress_rules](https://www.terraform.io/docs/providers/aws/r/security_group.html#ingress)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [cidr_blocks](https://www.terraform.io/docs/providers/aws/r/security_group.html#cidr_blocks)
    - [ipv6_cidr_blocks](https://www.terraform.io/docs/providers/aws/r/security_group.html#ipv6_cidr_blocks)
    - [prefix_list_ids](https://www.terraform.io/docs/providers/aws/r/security_group.html#prefix_list_ids)
    - [from_port](https://www.terraform.io/docs/providers/aws/r/security_group.html#from_port)
    - [protocol](https://www.terraform.io/docs/providers/aws/r/security_group.html#protocol)
    - [security_groups](https://www.terraform.io/docs/providers/aws/r/security_group.html#security_groups)
    - [self](https://www.terraform.io/docs/providers/aws/r/security_group.html#self)
    - [to_port](https://www.terraform.io/docs/providers/aws/r/security_group.html#to_port)
    - [description](https://www.terraform.io/docs/providers/aws/r/security_group.html#description-1)
  - Example:

```
ingress_rules = [
  {
    from_port = 80
    to_port   = 80
    protocol  = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
```

- [egress_rules](https://www.terraform.io/docs/providers/aws/r/security_group.html#egress)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [cidr_blocks](https://www.terraform.io/docs/providers/aws/r/security_group.html#cidr_blocks)
    - [ipv6_cidr_blocks](https://www.terraform.io/docs/providers/aws/r/security_group.html#ipv6_cidr_blocks)
    - [prefix_list_ids](https://www.terraform.io/docs/providers/aws/r/security_group.html#prefix_list_ids)
    - [from_port](https://www.terraform.io/docs/providers/aws/r/security_group.html#from_port)
    - [protocol](https://www.terraform.io/docs/providers/aws/r/security_group.html#protocol)
    - [security_groups](https://www.terraform.io/docs/providers/aws/r/security_group.html#security_groups)
    - [self](https://www.terraform.io/docs/providers/aws/r/security_group.html#self)
    - [to_port](https://www.terraform.io/docs/providers/aws/r/security_group.html#to_port)
    - [description](https://www.terraform.io/docs/providers/aws/r/security_group.html#description-2)
  - Example:

```
ingress_rules = [
  {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
```
