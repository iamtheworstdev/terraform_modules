resource "aws_security_group" "ecs" {
  name        = "${var.ecs_cluster_name}-ECS"
  description = "${var.ecs_cluster_name} ECS"
  vpc_id      = var.host_vpc_id
  tags = {
    Name = "${var.ecs_cluster_name}-ECS"
  }

  ingress {
    from_port       = var.ecs_container_port
    to_port         = var.ecs_container_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  dynamic "egress" {
    for_each = var.ecs_container_egresses
    content {
      from_port   = egress.from_port
      to_port     = egress.to_port
      protocol    = egress.protocol
      cidr_blocks = egress.cidr_blocks
    }
  }
}

resource "aws_security_group" "graphql_alb" {
  name        = "${var.ecs_cluster_name}-ALB"
  description = "${var.ecs_cluster_name} ALB"
  vpc_id      = var.host_vpc_id
  tags = {
    Name = "${var.ecs_cluster_name}-ALB"
  }

  dynamic "ingress" {
    for_each = var.alb_ingresses
    content {
      from_port   = ingress.from_port
      to_port     = ingress.to_port
      protocol    = ingress.protocol
      cidr_blocks = ingress.cidr_blocks
    }
  }

  egress {
    from_port   = var.ecs_container_port
    to_port     = var.ecs_container_port
    protocol    = "tcp"
    cidr_blocks = var.ecs_cidr_blocks
  }
}
