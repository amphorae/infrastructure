resource "github_repository" "infrastructure" {
  name         = "infrastructure"
  has_projects = true
  has_issues   = false
}

resource "github_repository" "dockerfiles" {
  name = "dockerfiles"
}
