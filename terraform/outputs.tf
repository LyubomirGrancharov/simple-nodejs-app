output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "kubeconfig" {
  value = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}

output "client_certificate" {
  value = google_container_cluster.primary.master_auth[0].client_certificate
}
