resource "github_team" "amphorae_admins" {
  name        = "amphorae_admins"
  description = "Amphorae Admins"
  privacy     = "closed"
}

resource "github_team_membership" "amphorae_admins" {
  team_id  = "${github_team.amphorae_admins.id}"
  username = "ryanl-ee"
  role     = "maintainer"
}

resource "github_team_repository" "amphorae_admins_infrastructure" {
  team_id    = "${github_team.amphorae_admins.id}"
  repository = "${github_repository.infrastructure.name}"
  permission = "admin"
}


resource "github_team_repository" "amphorae_admins_dockerfiles" {
  team_id    = "${github_team.amphorae_admins.id}"
  repository = "${github_repository.dockerfiles.name}"
  permission = "admin"
}