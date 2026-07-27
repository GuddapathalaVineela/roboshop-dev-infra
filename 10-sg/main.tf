# Using open source module

#module "catalogue" {
#    source = "terraform-aws-module/security-group-aws"
#    name = "${local.common_name_suffix}-catalogue"
#    use_name_prefix = false
#    description = "Security group for catalogue with custom ports open with vpc, egress all traffic"
#    vpc_id = data.aws_ssm.parameter.vpc_id.value
#}

module "sg" {
    source = "git::https://github.com/GuddapathalaVineela/terraform-aws-sg.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_names[count.index]
    sg_description = "Created for ${var.sg_names[count.index]}"
    vpc_id = local.vpc_id
}


# Frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type              = "ingress"
#   security_group_id = module.sg[9].sg_id # frontend SG ID
#   source_security_group_id = module.sg[11].sg_id # frontend ALB SG ID
#   from_port         = 80
#   protocol          = "tcp"
#   to_port           = 80
# }