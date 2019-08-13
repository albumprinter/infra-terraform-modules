# Module: ECR Repository - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.

------

#### ECR Repository Policy

* **aws_organization_id**: ID of an AWS Organization that should have access to the repository

#### ECR Repository Lifecycle Policy

* **max_number_of_images**: maximum number of images to be stored
