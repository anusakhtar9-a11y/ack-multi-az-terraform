variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "zone_a" {
  type    = string
  default = "ap-southeast-1a"
}

variable "zone_b" {
  type    = string
  default = "ap-southeast-1b"
}

variable "node_password" {
  type      = string
  sensitive = true
}