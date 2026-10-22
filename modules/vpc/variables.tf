variable "vpc_cidr" {
  type        = string
  default     = "172.16.0.0/12"
}

variable "zone_a" {
  type        = string
}

variable "zone_b" {
  type        = string
}

variable "vswitch_a_cidr" {
  type        = string
  default     = "172.16.1.0/24"
}

variable "vswitch_b_cidr" {
  type        = string
  default     = "172.16.2.0/24"
}