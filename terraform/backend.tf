terraform {
  backend "gcs" {
    bucket  = "tf_state_astarandel"
    prefix  = "terraform/state"
  }
}