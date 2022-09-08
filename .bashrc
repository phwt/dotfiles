# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && . "$HOME/.fig/shell/bashrc.pre.bash"

alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;echo "DNS flushed"'
alias dnt="dotnet"

alias dkr="docker"
alias dkc="docker-compose"

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

alias go="git open"
alias goa="git open -b -s actions"                                    # Open repository actions page
alias goc='git open -b -s compare/$(git rev-parse --abbrev-ref HEAD)' # Open compare page for current branch against default branch
alias grhh="grh HEAD^"                                                # Uncommit latest
alias gstas='git stash -- $(git diff --staged --name-only)'           # Stash only staged changes

alias nr="npm run"
alias ns="npm start"
alias nrd="npm run dev"
alias nrde="npm run develop"
alias nrb="npm run build"

function killport() {
    kill -9 $(lsof -i TCP:$@ | awk '/LISTEN/{print $2}')
}

# WSL Alias
alias eo="explorer.exe ."

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && . "$HOME/.fig/shell/bashrc.post.bash"
