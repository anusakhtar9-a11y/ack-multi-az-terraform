resource "alicloud_cs_managed_kubernetes" "ack" {
  name                         = "multi-az-ack-cluster"
  cluster_spec                 = "ack.pro.small"
  is_enterprise_security_group = true
  
  worker_vswitch_ids           = var.vswitch_ids
  
  pod_cidr                     = "172.20.0.0/16"
  service_cidr                 = "172.21.0.0/20"
  
  slb_internet_enabled         = true
}

resource "alicloud_cs_kubernetes_node_pool" "multi_az_nodes" {
  cluster_id           = alicloud_cs_managed_kubernetes.ack.id
  node_pool_name       = "multi-az-node-pool"
  vswitch_ids          = var.vswitch_ids
  instance_types       = var.worker_instance_types
  system_disk_category = "cloud_essd"
  system_disk_size     = 40

  desired_size         = 2
  min_size             = 2
  max_size             = 10

  password             = var.password
}