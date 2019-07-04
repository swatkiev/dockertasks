provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"

    # No importance for this value currently
    region = "us-east-1"
}
