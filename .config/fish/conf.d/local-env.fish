set -l local_env "$HOME/.config/local/env.fish"
set -g __local_env_launchctl_vars

function set_gui_env
    set -l name $argv[1]
    set -e argv[1]

    set -gx $name $argv
    set -ga __local_env_launchctl_vars $name
end

if test -r "$local_env"
    source "$local_env"
end

functions -e set_gui_env

if test (uname -s 2>/dev/null) = Darwin; and command -q launchctl
    for name in $__local_env_launchctl_vars
        if set -q $name
            set -l value $$name
            launchctl setenv "$name" "$value" >/dev/null 2>&1
        end
    end
end

set -e __local_env_launchctl_vars
