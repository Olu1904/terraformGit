resource "aws_instance" "main" {
    ami = data.aws_ssm_parameter.instance_ami.value
    instance_type = "t3.micro"
    key_name = "ooyekanmi1"
    subnet_id = aws_subnet.public[0].id
    vpc_security_group_ids = [ "sg-0701eaaaa983d1e19" ]
    tags = {
      "Name" = "ooyek_${var.default_tags.env}-EC2"
    }
    user_data = base64encode(file("C:/Users/oyeab/Downloads/terraform/user.sh"))
}