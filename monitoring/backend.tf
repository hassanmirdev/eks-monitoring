terraform{
  backend "s3" {
    bucket         = "terraformgithubbucket"
    key            = "Monitoring/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
