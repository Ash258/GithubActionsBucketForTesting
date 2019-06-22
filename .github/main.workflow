workflow "Issues" {
  on = "issues"
  resolves = ["IssueHandler"]
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

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Scheduled"
  secrets = ["GITHUB_TOKEN"]
}
