resource "aws_instance" "bastion" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_Security_group_ids = [local.bastion_sg_id]
    
    tags = merge (
    {
       Name = "${var.project_name}-${var.environment}-bastion"
    }
   ) 
}