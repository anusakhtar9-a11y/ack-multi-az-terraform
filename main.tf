terraform {
  required_version = ">= 1.3.0"
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.200.0"
    }
  }
}

provider "alicloud" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  zone_a = var.zone_a
  zone_b = var.zone_b
}

module "ack" {
  source = "./modules/ack"

  vpc_id      = module.vpc.vpc_id
  vswitch_ids = module.vpc.vswitch_ids
  password    = var.node_password
}