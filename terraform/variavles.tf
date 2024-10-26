# variables.tf
variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
  default     = "galvanic-cirrus-437510-m8"
}

variable "region" {
  description = "The region where the resources will be created."
  type        = string
  default     = "europe-west3"  
}

variable "zone" {
  description = "The zone where the resources will be created."
  type        = string
  default     = "europe-west3-c"  
}
