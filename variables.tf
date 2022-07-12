variable "PROJECT_NAME" {
  type = string
}

variable "DATAPROC_WORKERS" {
  type = number
  default = 0
}

locals {
  GCP_REGION = "us-east1"
}

resource "random_integer" "unique_num" {
    min = 1
    max = 100000
}