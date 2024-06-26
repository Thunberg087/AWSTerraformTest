terraform {
  cloud {
    organization = "aviliax" 
    workspaces {
      name = "test-project"
    }
  }
}

provider "aws" {
  region = "eu-north-1"

  access_key= var.access_key
  secret_key= var.secret_key
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  
  required_version = ">= 0.12"
}
