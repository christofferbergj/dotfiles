if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add Yabai functions to path
set fish_function_path $fish_function_path $fish_function_path/yabai

# Setup abbreviations
init_abbreviations

# Setup theme colors
init_gruvbox

# Override fish greeting
set fish_greeting

# Default editor
set -gx EDITOR nvim

# Force 24-bit color support
set -gx fish_term24bit 1

# Init zoxide
zoxide init fish | source

# Init Starship
starship init fish | source

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
