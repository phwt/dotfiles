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

# Pods logging with prompt for matching pattern
function klp() {
    pods=$(kubectl get pods)
    echo "$pods"

    read "pattern?Pattern: "
    result=$(grep -m 1 $pattern <<<"$pods")
    pod_id=$(awk -F' ' '{print $1}' <<<"$result")

    echo "Tailing the logs of: $pod_id"
    kubectl logs -f $pod_id
}

# Dry-run helm install
function hid() {
    helm install $1 $2 --dry-run --debug 2>&1 | less
}

alias go="g open"
alias grhh="grh HEAD^"

alias nr="npm run"
alias ns="npm start"
alias nrd="npm run dev"
alias nrde="npm run develop"
alias nrb="npm run build"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && . "$HOME/.fig/shell/bashrc.post.bash"
