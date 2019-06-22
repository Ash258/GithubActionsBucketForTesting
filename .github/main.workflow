workflow "Issues" {
  on = "issues"
  resolves = ["IssueHandler"]
}

workflow "Pull requests" {
  resolves = ["PullRequestHandler"]
  on = "pull_request"
}

workflow "Excavator" {
  on = "schedule(0 * * * *)"
  resolves = ["Excavate"]
}

action "IssueHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Issue"
  secrets = ["GITHUB_TOKEN"]
}

action "PullRequestHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "PR"
  secrets = ["GITHUB_TOKEN"]
}

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Scheduled"
  secrets = ["GITHUB_TOKEN"]
}
