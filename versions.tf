terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }

    github = {
      source  = "integrations/github"
      version = "4.23.0"
    }
  }
}
