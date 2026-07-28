locals {
    common_name_suffix = "${var.project_name}-${var.environment}"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
    common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
}

#Backend ALB listening on port number 80
resource "aws_lb_listener" "backend_alb" {
    load_balancer_arn = aws_lb.backend_alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        type = "fixed-response"

    fixed-response {
        content_type = "text/plain"
        message_body = "Hi, I am from backend ALB HTTP"
        status_code = "200"
    }
    }
}