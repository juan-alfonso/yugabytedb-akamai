terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.14.0"
    }
  }
  required_version = ">= 1.0" 
}

# Configure the Linode Provider
provider "linode" {
   token = var.linode_token
}