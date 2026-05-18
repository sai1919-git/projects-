terraform {
  backend "s3" {
    bucket         = "sai1919-terraform-state-bucket"
    key            = "multi-env/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}