provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-west-2"
}
variable "access_key" {
    default = ""
    description = "(optional) describe your variable"
}
variable "secret_key" {
    default = ""
    description = "(optional) describe your variable"
}

module "aws_instance" {
    source = "E:/MAR21/GIT/TERAFORM/modules/ec2fullnetworks"

    
}