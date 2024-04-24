terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "mezzzy-vpn-peering"
region = "us-central"
zone = "us-central1-a"
credentials = "mezzzy-vpn-peering-cbeab20de131.json"
}

resource "google_storage_bucket" "mezzy-site" {
  name          = "bigmezzy_bucket"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}



