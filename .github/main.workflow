workflow "Issues" {
  on = "issues"
  resolves = ["IssueHandler"]
}

workflow "Excavator" {
  on = "schedule(*/30 * * * *)"
  resolves = ["Excavate"]
}

workflow "PR push" {
  resolves = ["PRPush"]
  on = "push"
}

action "PRPush" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Push"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "Excavate" {
  uses = "Ash258/Scoop-GithubActions@master"
  args = "Push"
  env = {
    "GITH_EMAIL" = "cabera.jakub@gmail.com"
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
