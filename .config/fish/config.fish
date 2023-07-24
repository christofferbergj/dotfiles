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


thefuck --alias | source
