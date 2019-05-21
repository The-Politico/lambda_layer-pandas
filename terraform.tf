provider "aws" {
  region = "us-east-1"
  profile = "interactives"
}


output "arn" {
  value = "${aws_lambda_layer_version.lambda_layer.arn}"
}

terraform {
  backend "s3" {
    bucket = "politico-terraform-configs"
    key = "configs/lambda-layer-pandas/terraform.tfstate"
    region = "us-east-1"
    profile = "interactives"
    encrypt = true
  }
}


resource "aws_lambda_layer_version" "lambda_layer" {
  filename = "lambda_layer.zip"
  layer_name = "lambda_layer-pandas"

  compatible_runtimes = ["python3.6"]
}
