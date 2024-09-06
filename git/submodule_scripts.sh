git_show_branch_all_submodules() {
    local branch_name=$1
    if [[ -z "$branch_name" ]]; then
        echo "Usage: git_show_branch_all_submodules <branch_name>"
        return 1
    fi

    git submodule foreach --recursive "git show-branch $branch_name || :"
}

git_checkout_branch_all_submodules() {
    # Check if the branch name is provided as an argument
    if [ -z "$1" ]; then
        echo "Usage: git_checkout_branch_all_submodules <branch-name>"
        return 1
    fi

    local BRANCH=$1

    # Run the command in each submodule
    git submodule foreach --recursive "git checkout $BRANCH || :"

    # Optionally, pull the latest changes from the branch
    # Uncomment the following line if you want to do that
    # git submodule foreach --recursive "git pull origin $BRANCH || :"

    echo "Checked out branch '$BRANCH' in all submodules."
}

git_checkout_and_pull_branch_all_submodules() {
    # Check if the branch name is provided as an argument
    if [ -z "$1" ]; then
        echo "Usage: git_checkout_branch_all_submodules <branch-name>"
        return 1
    fi

    local BRANCH=$1

    # Run the command in each submodule
    git submodule foreach --recursive "git checkout $BRANCH || :"

    # Optionally, pull the latest changes from the branch
    # Uncomment the following line if you want to do that
    git submodule foreach --recursive "git pull origin $BRANCH || :"

    echo "Checked out branch '$BRANCH' in all submodules."
}

git_checkout_and_rebase_all_submodules() {
    # Check if the branch name is provided as an argument
    if [ -z "$1" ]; then
        echo "Usage: git_checkout_and_rebase_all_submodules <branch-name>"
        return 1
    fi

    local BRANCH=$1
    local BASE_BRANCH=""

    # Determine if 'main' or 'master' exists and set the BASE_BRANCH accordingly
    if git show-ref --verify --quiet refs/heads/main; then
        BASE_BRANCH="main"
    elif git show-ref --verify --quiet refs/heads/master; then
        BASE_BRANCH="master"
    else
        echo "Neither 'main' nor 'master' branch exists in the repository."
        return 1
    fi

    # Run the command in each submodule
    git submodule foreach --recursive "
        git checkout $BASE_BRANCH || :
        git pull || :
        git checkout $BRANCH || :
        git rebase $BASE_BRANCH || :
    "

    # Optionally, pull the latest changes from the branch itself
    # Uncomment the following line if you want to do that
    # git submodule foreach --recursive "git pull --rebase origin $BRANCH || :"

    echo "Checked out branch '$BRANCH', pulled latest '$BASE_BRANCH', and rebased '$BRANCH' over '$BASE_BRANCH' in all submodules."
}

