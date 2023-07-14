terraform {
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

