terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.215.0"
    }
  }
}

provider "alicloud" {
  region = "ap-southeast-1" # Aap apne pasand ka region rakh sakte hain (e.g., ap-southeast-1 ya cn-beijing)
}