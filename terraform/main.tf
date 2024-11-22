# resource "google_compute_address" "jenkins_static_ip" {
#   name = "jenkins-static-ip"
# }

resource google_compute_instance "jenkins_server" {
  name         = "${var.instance_name}"
  zone         = "${var.instance_zone}"
  machine_type = "${var.instance_type}"
  
  tags = ["http-server"]

  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-11"
      }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("${path.module}/jenkins-startup.sh")
}