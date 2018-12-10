data "google_compute_image" "my_image" {
  name    = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "myTerraformVM" {
	name = "ThemyTerraformVM"
	machine_type = "f1-micro"
	zone = "us-west1-a"

	boot_disk {
		initialize_params {
			image = "${data.google_compute_image.my_image.self_link}"
		}
	}
	
	network_interface {
	subnetwork = "${google_compute_subnetwork.dev-subnet.name}"

	access_config {

		}
	}

	metadata {
		foo = "bar"
	}

	service_account {
		scopes = ["userinfo-email", "compute-ro", "storage-ro"]
	}

}