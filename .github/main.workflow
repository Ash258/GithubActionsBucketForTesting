workflow "Issues" {
  on = "issues"
  resolves = ["IssueHandler"]
}

workflow "Excavator" {
  on = "schedule(*/30 * * * *)"
  resolves = ["Excavate"]
}

workflow "Pull requests" {
    resolves = ["PullRequestHandler"]
    on = "pull_request"
}

workflow "Pull requests comment" {
    resolves = ["PullRequestHandler"]
    on = "issue_comment"
}

action "PullRequestHandler" {
  uses = "Ash258/Scoop-GithubActions@0.7.1"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
    "SKIP_UPDATED" = "1"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "IssueHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}
