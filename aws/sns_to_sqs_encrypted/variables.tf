variable "account_id" {
  type        = "string"
  description = "AWS account ID"
}

variable "env" {
  type        = "string"
  description = "(dev|test|prod)"
}

variable "name" {
  type        = "string"
  description = "Name you wish to give the queue"
}

variable "region" {
  type        = "string"
  description = "Region you are deploying the resources in. Does not override the provider."
}
