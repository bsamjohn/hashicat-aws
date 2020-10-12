module "vpc" {
  source  = "app.terraform.io/bennette-training/vpc/aws"
  version = "2.57.0"
  # insert required variables here

name = "simple-example"

  azs             = ["us-east-1", "us-east-2", "us-east-3"]
  private_subnets = ["10.0.1.0/16"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = true

  cidr = "10.0.0.0/16"

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "my-vpc"
  }
}
