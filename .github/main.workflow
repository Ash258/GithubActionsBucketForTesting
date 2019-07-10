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

workflow "Pull requests comment" {
    resolves = ["Push"]
    on = "push"
}

action "Push" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Push"
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

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Scheduled"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
    "SKIP_UPDATED" = "1"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "IssueHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Issue"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}
