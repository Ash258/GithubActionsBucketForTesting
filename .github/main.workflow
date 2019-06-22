workflow "Issues" {
  on = "issues"
  resolves = ["IssueHandler"]
}

workflow "Excavator" {
  on = "schedule(0 * * * *)"
  resolves = ["Excavate"]
}

workflow "PRs" {
  resolves = ["PullRequestHandler"]
  on = "pull_request"
}

action "IssueHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Issue"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Scheduled"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "PullRequestHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "PR"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}
