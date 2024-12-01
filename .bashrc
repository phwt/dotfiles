# ? Only required for Git Bash for Windows
# if [ -t 1 ]; then
#   exec zsh
# fi

alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;echo "DNS flushed"'
alias ls="ls -Gla --color"

alias dnt="dotnet"
alias defm="dotnet ef migrations"
alias defd="dotnet ef database"

# cd-ing into .NET DDD projects
alias cda="cd *API*"
alias cdb="cd *Backend*"
alias cdd="cd *Domain*"
alias cdi="cd *Infrastructure*"

alias tf="terraform"
alias tfws="terraform workspace select"

alias dkr="docker"
alias dkc="docker compose"

alias k="kubectl"
alias kg="k get -o wide"
alias kd="k describe"
alias ka="k apply -f"
alias kl="k logs -f"

# Set default namespace
function kdns() {
    kubectl config set-context --current --namespace=$@
}

# Pods logging with prompt for matching pattern
function klp() {
    pods=$(kubectl get pods $@)
    echo "$pods"

    read "pattern?Pattern: "
    result=$(grep -m 1 $pattern <<<"$pods")
    pod_id=$(awk -F' ' '{print $1}' <<<"$result")

    echo "Tailing the logs of: $pod_id"
    kubectl logs -f $pod_id
}

# Get and copy the matching resource id to the clipboard
function kcp() {
    output=$(kubectl get $@ -o wide)
    echo "$output"

    read "pattern?Pattern: "
    result=$(grep -m 1 $pattern <<<"$output")
    res_id=$(awk -F' ' '{print $1}' <<<"$result")

    echo -n "$res_id" | pbcopy
    echo "Added to clipboard: $res_id"
}

# Dry-run helm install
function hid() {
    helm install $1 $2 --dry-run --debug 2>&1 | less
}

# Delete both local and remote tag
function gtd() {
    git tag -d $1 && git push -d origin $1
}

# Clone and cd
function gccd() {
    git clone "$1" && cd "$(basename $1 .git)"
}

alias go="git open"
alias goa="git open -b -s actions"                                    # Open repository actions page
alias goc='git open -b -s compare/$(git rev-parse --abbrev-ref HEAD)' # Open compare page for current branch against default branch
alias grhh="git reset HEAD^"                                          # Uncommit latest
alias gstas='git stash -- $(git diff --staged --name-only)'           # Stash only staged changes
alias gt="git tag"
alias gtdl="git tag -d"         # Delete local tag
alias gtdr="git push -d origin" # Delete remote tag
alias gsur="git submodule update --remote"
alias gfp="git fetch --prune"
alias gbdm="git branch --merged | egrep -v \"(^\*|master|main|dev|acc)\" | xargs git branch -d" # Delete merged branch
alias gbds="git-delete-squashed"                                                                # https://github.com/teppeis/git-delete-squashed
alias gbc="gbdm && gbds"

alias nr="npm run"
alias ns="npm start"
alias nrd="npm run dev"
alias nrde="npm run develop"
alias nrb="npm run build"

alias python="python3"
alias py="python"

function killport() {
    kill -9 $(lsof -i TCP:$@ | awk '/LISTEN/{print $2}')
}

function b64e() {
    echo -n $1 | base64
}

function b64en() {
    echo $1 | base64
}

function b64d() {
    echo $1 | base64 -d
}

# WSL Alias
alias eo="explorer.exe ."

DOTNET_CLI_TELEMETRY_OPTOUT=1
HOMEBREW_NO_ANALYTICS=1
