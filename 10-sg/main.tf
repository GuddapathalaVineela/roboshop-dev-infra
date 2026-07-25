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