workflow "Issues" {
    on = "issues"
    resolves = "IssueHandler"
}

action "IssueHandler" {
    uses = "Ash258/Scoop-GithubActions@master"
    args = "Issue"
    secrets = ["GITHUB_TOKEN"]
}
