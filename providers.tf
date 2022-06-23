provider "google" {
  project     = var.PROJECT_NAME
  region      = local.GCP_REGION
}