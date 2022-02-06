# Default editor
set -gx EDITOR nvim

# Init starhip prompt
starship init fish | source

# Bootstrap autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

