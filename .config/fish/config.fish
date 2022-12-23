if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Override fish greeting
set fish_greeting

# Default editor
set -gx EDITOR nvim

# Base colors for prompt to match iterm scheme
set -gx fish_term24bit 0

# Init zoxide
zoxide init fish | source

# Init Starship
starship init fish | source
