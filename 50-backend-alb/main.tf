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