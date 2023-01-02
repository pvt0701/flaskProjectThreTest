terraform {
  cloud {
    organization = "pvt0701"

    workspaces {
      name = "Github_Actions"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}

