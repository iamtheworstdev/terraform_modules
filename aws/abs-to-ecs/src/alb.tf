resource "aws_alb" "alb" {
  name               = var.ecs_cluster_name
  load_balancer_type = "application"
  internal           = var.internal
  subnets            = var.alb_subnet_ids
  security_groups    = concat(var.alb_security_group_ids, [aws_security_group.alb.id])
}

resource "aws_lb_target_group" "target_group" {
  name        = var.ecs_cluster_name
  port        = var.ecs_container_port
  protocol    = "https"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    matcher = "200,301,302"
    path    = "/"
  }
}

resource "aws_lb_listener" "listener" {
  certificate_arn   = var.acm_certificate_arn
  load_balancer_arn = aws_alb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_listener_certificate" "graphql" {
  listener_arn    = aws_lb_target_group.target_group.arn
  certificate_arn = var.acm_certificate_arn
}
