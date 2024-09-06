alias moduleMaster="git submodule foreach --recursive 'git checkout master || git checkout main || :'"

alias modulePull="git submodule foreach --recursive 'git pull || :'"