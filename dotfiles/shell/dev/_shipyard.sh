# NOTE: `ship` function depends on `gh`

shipyard-env() {
    # Get shipyard environment from PR #
    # e.g., `shipyard-env 123`
    shipyard get environments --pull-request-number $1 | awk 'NR>2 {print $2}' | xargs
}

shipyard-shell() {
    # Execute given command ($3, default: `bash`) in service ($2, default: `api`) within environment ($1)
    # e.g., `shipyard-shell $(shipyard-env 123) postgres bash`

    if [[ $# -eq 0 ]] ; then
        echo "Please provide the environment, service, and command to run in Shipyard, e.g.,"
        echo "\n    shipyard-shell [env id|pr number] [service (default: api)] [command (default: bash)]\n"
        return
    fi

    # If numeric value is given in place of environment id, get environment id from PR #
    if [[ $1 =~ '^[0-9]+$' ]]; then
        pr_env=$(shipyard-env $1)
    else
        pr_env=$1
    fi

    service="${2:-api}"
    command="${${@:3}:-bash}"

    shipyard exec --env $pr_env --service $service -- $command
}

shipyard-in() {
    # Execute given command ($2) in API service within environment ($1)
    # e.g., `shipyard-in $(shipyard-env 123) bundle exec rails c`
    shipyard-shell $1 api ${@:2}
}

ship() {

    # Get PR number or branch (defaulting to current branch)

    if [[ $# -eq 0 ]] ; then
        echo "Please enter PR number or branch name. To proceed with the current branch, press <Enter>: "
        read user_input
    else
        user_input=$1
    fi

    if [[ -z $user_input ]]; then
        user_input=$(git branch --show-current)
    fi

    # Get PR number if branch is given

    if [[ $user_input =~ '^[0-9]+$' ]] ; then
        pull_request=$user_input
    else
        pull_request=$(gh pr view $user_input --json number --template '{{.number}}')
    fi

    # Exit if no PR number given/found

    if [[ -z $pull_request ]]; then
        return
    fi

    # Exit if no PR found with given number

    pull_request_title=$(gh pr view $user_input --json title --template '{{.title}}')

    if [[ -z $pull_request_title ]]; then
        return
    fi

    # Otherwise, display the selected PR's title

    echo "Pull request: $pull_request_title"

    # Find the shipyard environment for the selected PR

    # environment=$(shipyard get environments --pull-request-number $pull_request | awk 'NR>2 {print $2}')
    environment=$(shipyard-env $pull_request)

    if [ -z "$environment" ]; then
        echo "No environment found for PR#$pull_request"
        return
    fi

    echo "Entering env: $environment"
    shipyard-in $environment bundle exec rails c
}
