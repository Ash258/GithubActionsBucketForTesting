workflow "Issues" {
    on = "issues.opened"
    resolves = "IssueHandler"
}

action "IssueHandler" {
    uses = "Ash258/Scoop-GithubActions@master"
    args = "Issue"
    secrets = ["GITHUB_TOKEN"]
}
