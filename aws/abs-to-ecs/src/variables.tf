variable "acm_certificate_arn" {
  type = string
}

variable "alb_ingresses" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "alb_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_ids" {
  type = list(string)
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ecs_cidr_blocks" {
  type = list(string)
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_container_port" {
  type = number
}

variable "ecs_container_protocol" {
  type   = set(string)
  values = ["HTTP", "HTTPS"]
}

variable "internal_alb" {
  type    = bool
  default = true
}

variable "vpc_id" {
  type = string
}
