terraform {
  backend "gcs" {
    bucket  = "tf_state_astarandel"
    prefix  = "terraform/state"
    project = var.project_id
  }
}