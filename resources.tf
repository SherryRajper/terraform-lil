resource "google_compute_network" "our_development_network" {
	name = "devnetwork"
	auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet" {
	ip_cidr_range = "10.0.1.0/24"
	name = "devsubnet"
	network = "${google_compute_network.our_development_network.self_link}"
	region = "us-west1"
}