module "catalogue" {
    source = "terraform-aws-module/security-group-aws"
    name = "${local.common_name_suffix}-catalogue"
    use_name_prefix = false
    description = "Security group for catalogue with custom ports open with vpc, egress all traffic"
    vpc_id = data.aws_ssm.parameter.vpc_id.value
}