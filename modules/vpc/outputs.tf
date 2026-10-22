output "vpc_id" {
  value = alicloud_vpc.main.id
}

output "vswitch_ids" {
  value = [
    alicloud_vswitch.vswitch_a.id,
    alicloud_vswitch.vswitch_b.id
  ]
}