data "aws_ami" "joindevops" {
    owners = [""]
    most_recent = true
    filter {
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_ssm_parameter" "open_vpn_sg_id" {
    name = "/${var.project_name}/${var.environment}/open_vpn_sg_id"
}
