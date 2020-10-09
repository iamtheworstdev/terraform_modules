resource "aws_cloudwatch_log_group" "log_group" {
  name              = "${var.ecs_cluster_name}-log"
  retention_in_days = 30

  tags = {
    Name = "${var.ecs_cluster_name}-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "${var.ecs_cluster_name}-log-stream"
  log_group_name = aws_cloudwatch_log_group.log_group.name
}
