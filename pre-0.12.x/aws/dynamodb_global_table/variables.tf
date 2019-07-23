variable "env" {
  type    = "string"
  default = "dev"
}

variable "hash_key" {
  type = "string"
}

variable "hash_key_datatype" {
  type    = "string"
  default = "S"
}

variable "name" {
  type = "string"
}

variable "pitr" {
  type    = "string"
  default = "true"
}

variable "range_key_datatype" {
  type    = "string"
  default = "N"
}

variable "range_key" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "sse" {
  type    = "string"
  default = "true"
}

variable "ttl" {
  type    = "string"
  default = "false"
}

variable "ttl_attribute" {
  type    = "string"
  default = "TimeToLive"
}
