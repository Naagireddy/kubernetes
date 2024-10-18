provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-west-2"
}

variable "access_key" {
    default = ""
    
}

variable "secret_key" {
    default = ""

}
variable "private_key" {
    default = "./First_Key.pem"
    description = "(optional) describe your variable"
}

variable "instance_type" {
    default = ""
    description = "(optional) describe your variable"
}

variable "availability_zone" {
    default = "us-west-2"
    description = "(optional) describe your variable"
}

variable "os_user" {
    default = "ec2-user"
    description = "this user for ubuntu machine onley"
}



resource "aws_vpc" "my-vpc" {
    cidr_block= "10.0.0.0/16"
    tags {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "my-subnet" {
    cidr_block = "10.0.0.0/24"
    vpc_id= "${aws_vpc.my-vpc.id}"
    tags {
        Name= "subnet1"
    }
}

resource "aws_security_group" "allow_all" {
    name = "allow_all"
    vpc_id= "${aws_vpc.my-vpc.id}"

    ingress = {
        from_port = "0"
        to_port   = "6000"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress = {
        from_port = "0"
            to_port = "6000"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.my-vpc.id}"

    tags = {
        Name = "my-int-gateway"
    }
}

resource "aws_route_table" "my_route_table" {
    vpc_id = "${aws_vpc.my-vpc.id}"
}

resource "aws_route_table" "my_route" {
    route_table_id = "${aws_route_table.my_route_table.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"

}

resource "aws_route_table_accociation" "arta" {
    route_table_id = "${aws_route_table.my_route_table.id}"
    subnet_id = "${aws_subnet.my-subnet.id}"
    gateway_id = "${aws_internet_gateway.igw.id}"
}

resource "aws_instance" "web" {
    ami = "${var.instance_type}"
    availability_zone = "${var.availability_zone}"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.allow_all.id}"]
    subnet_id = "${aws_subnet.my-subnet.id}"
    associate_public_ip_address = true

    connection {
        user = "${var.os_user}"
        private_key= "${file("${var.private_key}")}"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update -y",
            "sudo apt-get install git -y",
            "sudo apt-get instll tree -y"
        ]
    
    }
    
}       