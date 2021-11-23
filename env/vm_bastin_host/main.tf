/*module "disk_policy_creation" {
  source = "../../../../../modules/compute_engine/disk_snapshot_policy"

  #global 
  policy_name      = var.disk_snapshot_policy_name
  utc_time         = "20:00"
  retention_days   = "7"
  storage_location = "us"
}*/

module "bastion_host" {
  source = "../../../../../modules/compute_engine/linux_vm"
  count  = length(var.bastion_host)

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name            = var.bastion_host[count.index]["machine_name"]
  machine_type            = var.bastion_host[count.index]["machine_type"]
  machine_zone            = var.bastion_host[count.index]["machine_zone"]
  instance_labels         = var.bastion_host[count.index]["instance_labels"]
  vm_deletion_protect     = var.bastion_host[count.index]["vm_deletion_protect"]
  instance_image_selflink = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210720"

  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = var.bastion_host[count.index]["network_tags"]
  internal_ip        = var.bastion_host[count.index]["internal_ip"]
  enable_external_ip = var.bastion_host[count.index]["enable_external_ip"]

  /* disk details */
  boot_disk_info = var.bastion_host[count.index]["boot_disk0_info"]
  disk_labels    = var.bastion_host[count.index]["disk_labels"]
  #snapshot_policy_name = module.disk_policy_creation.policy_name

  /* service account */
  service_account = var.service_account

  /*metadata*/
  metadata = {}
}


/*module "attach_data_disk" {
  source               = "../../../../../modules/compute_engine/attach_data_disk"
  count                = length(var.bastion_host)
  compute_instance_id  = module.bastion_host[count.index].compute_instance_id
  machine_zone         = module.bastion_host[count.index].machine_zone
  data_disk_info       = var.bastion_host[count.index]["data_disk_info"]
  disk_labels          = var.bastion_host[count.index]["disk_labels"]
  snapshot_policy_name = module.disk_policy_creation.policy_name
}*/


