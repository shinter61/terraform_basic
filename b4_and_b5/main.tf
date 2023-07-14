terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    datadog = {
      source  = "DataDog/datadog"
    }
  }

  backend "s3" {
    bucket  = "sre-onboarding-shinta-b4-tfstate"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
    profile = "saml"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "saml"
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

