provider "google-beta" {
  project     = var.PROJECT_NAME
  region      = local.GCP_REGION
}

provider "google" {
  project     = var.PROJECT_NAME
  region      = local.GCP_REGION
}