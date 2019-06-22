workflow "Issues" {
  on = "issues"
  resolves = ["IssueHandler"]
}

action "IssueHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Issue"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Pull requests" {
  resolves = ["PullRequestHandler"]
  on = "pull_request"
}

action "PullRequestHandler" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "PR"
  secrets = ["GITHUB_TOKEN"]
}

workflow "Excavator" {
  on = "schedule(0 * * * *)"
  resolves = ["Excavate"]
}

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Scheduled"
  secrets = ["GITHUB_TOKEN"]
}
