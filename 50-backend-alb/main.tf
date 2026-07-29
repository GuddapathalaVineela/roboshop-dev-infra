resource "aws_lb" "backend_alb" {
    name = "${local.common_name_suffix}-backend_alb" # roboshop-dev-backend-alb
    internal = true
    load_balance_type = "application"
    security_groups = [local.backend_alb_sg_id]
    subnets = local.private_subnet_ids
    enable_deletion_protection = true #prevents accidential deletion UI

    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-backend-alb"
        }
    )
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

resource "aws_security_group_rule" "bakend_alg_sg_id" {
    type = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 80
    protocol = "tcp"
    to_port = 80
}