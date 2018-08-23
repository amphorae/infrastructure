resource "github_repository_project" "infrastructure" {
  name       = "Infrastructure Project"
  repository = "${github_repository.infrastructure.name}"
  body       = "Infrastructure Project"
}