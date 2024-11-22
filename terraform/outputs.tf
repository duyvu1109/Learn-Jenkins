output "network_IP" {
  value = google_compute_instance.jenkins_server.network_interface.0.access_config.0.nat_ip
  description = "The external ip address of the instance"
}
