workflow "Issues" {
    on = "issue"
    resolve = "IssueHandler"
}

action "IssueHandler" {
    use = "Ash258/Scoop-GithubActions@master"
    args = "Issue"
}
