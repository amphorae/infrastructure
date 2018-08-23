provider "github" {
  token        = "${var.github_token}"
  organization = "amphorae"
}

resource "github_repository" "infrastructure" {
  name = "infrastructure"
}

resource "github_repository" "dockerfiles" {
  name = "dockerfiles"
}