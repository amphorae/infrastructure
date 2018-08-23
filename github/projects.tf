resource "github_organization_project" "amphorae" {
  name = "Amphorae Project"
  body = "Amphorae Project"
}

resource "github_repository_project" "infrastructure" {
  name       = "Infrastructure Project"
  repository = "${github_repository.infrastructure.name}"
  body       = "Infrastructure Project"
}
