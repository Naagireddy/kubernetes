provider "aws" {
    access_key = "AKIA6RC3KTEIKZSP7HCE"
    secret_key = "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"
    region = "us-west-2"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.10.0.0/16"
}
#terraform init --backend-config="dynamodb_table=statefile" --backend-config="access_key=AKIA6RC3KTEIKZSP7HCE" --backend-config="secret_key=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"
# terraform apply
# the above init command should be run all the users which means who wants run this script.
terraform {
  backend "s3" {
    bucket = "tf-statefile-shared-location"
    key    = "my-module-demo.state"
    region = "us-west-2"
    dynamodb_table = "statefile"
  }
}

