set -l codex_env "$HOME/.config/codex/env.fish"

if test -r "$codex_env"
    source "$codex_env"
end

if test (uname -s 2>/dev/null) = Darwin; and command -q launchctl
    if set -q UIDOTSH_MCP_AUTHORIZATION
        launchctl setenv UIDOTSH_MCP_AUTHORIZATION "$UIDOTSH_MCP_AUTHORIZATION" >/dev/null 2>&1
    end
end
