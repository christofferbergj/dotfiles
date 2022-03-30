# Default editor
set -gx EDITOR nvim

# Base colors for prompt to match iterm scheme
set -gx fish_term24bit 0

# Init starship promp
starship init fish | source

# Init autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
