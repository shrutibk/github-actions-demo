#Global
project_id = "searce-playground"
region     = "us-central1"

#Network Interface
network    = "shrutik-test-vpc"
subnetwork = "subnet-1"

#disk_snapshot_policy_name = "dev-bastion-host-vm-disk-snapshot-policy"

#Access scopes 
service_account = {
  email  = "531268413988-compute@developer.gserviceaccount.com"
  scopes = ["cloud-platform"]
}

bastion_host = [
  {
    machine_type = "e2-micro"
    machine_name = "shrutik-test-instnace"
    machine_zone = "us-central1"
    instance_labels = {
      env  = "owner"
      name = "shrutik"
    }
    network_tags        = ["shrutik"]
    vm_deletion_protect = false
    internal_ip         = "10.140.0.2"
    enable_external_ip  = true
    boot_disk0_info = {
      disk_size_gb = 10
      disk_type    = "pd-standard"
      auto_delete  = false
    }
    /*data_disk_info = {
      disk_name    = "prod-eco-admin-asia-sth1-b-data01-disk"
      disk_size_gb = 50
      disk_type    = "pd-ssd"
    }*/
    disk_labels = {
      env = "dev"
      app = "bastion"
    }
  }
]