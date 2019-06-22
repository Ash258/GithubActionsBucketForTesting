workflow "Issues" {
    on = "issues"
    resolves = [ "IssueHandler" ]
}

action "IssueHandler" {
    uses = "Ash258/Scoop-GithubActions@master"
    args = "Issue"
    secrets = [ "GITHUB_TOKEN" ]
}
workflow "Excavator" {
    on = "schedule(0 * * * *)"
    resolves = [ "Excavate" ]
}

# Post comment to specific issue each 5 minutes
action "Excavate" {
    uses = "Ash258/Scoop-GithubActions@master"
    args = "Scheduled"
    secrets = [ "GITHUB_TOKEN" ]
}
