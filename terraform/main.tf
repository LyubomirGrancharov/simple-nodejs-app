resource "google_container_cluster" "primary" {
  name     = "small-gke-cluster"
  location = "us-central1-a"
  deletion_protection = false

  initial_node_count = 1 
  
  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

 
  remove_default_node_pool = true
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "default-node-pool"
  node_count = 1

  node_config {
    machine_type = "e2-small"
    disk_size_gb = 20 
  }
}


