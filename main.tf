resource "google_storage_bucket" "de-first-bucket" {
  name          = "my-first-bucket-${random_integer.unique_num.result}"
  location      = local.GCP_REGION
  force_destroy = true
  storage_class = "STANDARD"
  

  uniform_bucket_level_access = true

}