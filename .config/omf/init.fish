# Default editor
set -gx EDITOR nvim

# Base colors for prompt to match iterm scheme
set -gx fish_term24bit 0

# Init starhip prompt
starship init fish | source

# Bootstrap autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

