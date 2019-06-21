workflow "Issues" {
    on = "issues"
    resolve = "IssueHandler"
}

action "IssueHandler" {
    uses = "Ash258/Scoop-GithubActions@master"
    args = "Issue"
}
