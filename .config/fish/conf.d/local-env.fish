set -l local_env "$HOME/.config/local/env.fish"

if test -r "$local_env"
    source "$local_env"
end

if test (uname -s 2>/dev/null) = Darwin; and command -q launchctl
    set -l launchctl_vars UIDOTSH_MCP_AUTHORIZATION

    if set -q LOCAL_ENV_LAUNCHCTL_VARS
        set launchctl_vars $launchctl_vars $LOCAL_ENV_LAUNCHCTL_VARS
    end

    for name in $launchctl_vars
        if set -q $name
            set -l value $$name
            launchctl setenv "$name" "$value" >/dev/null 2>&1
        end
    end
end
