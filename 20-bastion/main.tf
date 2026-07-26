resource "aws_instance" "terraform" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_Security_group_ids = [aws_security_group.allow_all.id]
    
    tags = {
        Name = "terraform-1"
        Terraform = "true"
    }
}