resource "google_storage_bucket" "de_first_bucket" {
  name          = "nerd-de-bucket-${random_integer.unique_num.result}"
  location      = local.GCP_REGION
  force_destroy = true
  storage_class = "STANDARD"


  uniform_bucket_level_access = true

}

resource "google_dataproc_cluster" "de_dataproc_cluster" {
  name   = "nerd-de-dpcluster-${random_integer.unique_num.result}"
  region = local.GCP_REGION
  provider = google-beta
  cluster_config {
    endpoint_config {
      enable_http_port_access = "true"
    }
    
    master_config {
      num_instances    = 1
      machine_type     = "n1-standard-2"
      min_cpu_platform = "Intel Skylake"

      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 50
        num_local_ssds    = 0
      }
    }
    worker_config {
      num_instances = var.DATAPROC_WORKERS
    }
    software_config {
      image_version = "2.0-debian10"

      optional_components = ["JUPYTER"]

      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

  }
}
