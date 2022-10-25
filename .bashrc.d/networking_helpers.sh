# Usage
# $ listeners
# $ listeners | nolocal
# $ connections | nolocal
function nolocal () {
    grep -v -E 'TCP (127\.0\.0\.1|\[::1\])\:[a-z0-9-]+ \((LISTEN|ESTABLISHED)\)$' "$@";
}
alias listeners='lsof +c0 -n -iTCP -sTCP:LISTEN';
alias connections='lsof +c0 -n -iTCP -sTCP:ESTABLISHED';

function shellquote () {
    for ARG in "$@"; do
        printf '%q ' "$ARG";
    done;
    echo;
}

function rdo () {
    local rhost="$1"; shift;
    # shellcheck disable=SC2029
    ssh "$rhost" "$(shellquote "$@")";
    return;
}
