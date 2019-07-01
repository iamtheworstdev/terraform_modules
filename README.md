# terraform_modules

## THESE ARE ALL IN TERRAFORM 0.12.X format!

Doesn't mean much for Terraform 0.11.x users except that you may need to change any map variables or check where variables are referenced by `something = var.something` and change to `something = "${var.something}"`

## Included modules

1. Multi-region API Gateway
1. Really bad global dynamodb table (it'll work but you'll want to review it before throwing it in production)

### Todo

- [ ] When Terraform finally supports looping modules I will change the API Gateway to be given a list of regions and iterate through that to create resources.
