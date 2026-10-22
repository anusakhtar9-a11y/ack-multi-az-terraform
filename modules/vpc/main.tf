resource "alicloud_vpc" "main" {
  vpc_name   = "ack-multi-az-vpc"
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vswitch_a" {
  vpc_id       = alicloud_vpc.main.id
  cidr_block   = var.vswitch_a_cidr
  zone_id      = var.zone_a
  vswitch_name = "ack-vswitch-zone-a"
}

resource "alicloud_vswitch" "vswitch_b" {
  vpc_id       = alicloud_vpc.main.id
  cidr_block   = var.vswitch_b_cidr
  zone_id      = var.zone_b
  vswitch_name = "ack-vswitch-zone-b"
}

resource "alicloud_nat_gateway" "nat" {
  vpc_id           = alicloud_vpc.main.id
  nat_gateway_name = "ack-nat-gw"
  payment_type     = "PayAsYouGo"
  vswitch_id       = alicloud_vswitch.vswitch_a.id
  nat_type         = "Enhanced"
}

resource "alicloud_eip_address" "eip" {
  bandwidth            = "10"
  internet_charge_type = "PayByTraffic"
}

resource "alicloud_eip_association" "eip_assoc" {
  allocation_id = alicloud_eip_address.eip.id
  instance_id   = alicloud_nat_gateway.nat.id
}

resource "alicloud_snat_entry" "snat_a" {
  snat_table_id     = alicloud_nat_gateway.nat.snat_table_ids
  source_vswitch_id = alicloud_vswitch.vswitch_a.id
  snat_ip           = alicloud_eip_address.eip.ip_address
}

resource "alicloud_snat_entry" "snat_b" {
  snat_table_id     = alicloud_nat_gateway.nat.snat_table_ids
  source_vswitch_id = alicloud_vswitch.vswitch_b.id
  snat_ip           = alicloud_eip_address.eip.ip_address
}