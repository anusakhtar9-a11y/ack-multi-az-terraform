variable "vpc_id" {
  type = string
}

variable "vswitch_ids" {
  type = list(string)
}

variable "worker_instance_types" {
  type    = list(string)
  default = ["ecs.g6.large"]
}

variable "password" {
  type      = string
  sensitive = true
}