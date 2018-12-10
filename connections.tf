provider "google" {
	credentials = "${file("../account.json")}"
	project = "cloudyterraform"
	region = "us-west1"
}
