# Setup a single space
function yabai_setup_space -d "Setup a single space"
  set -l idx $argv[1]

  # Get amount of displays
  set -l display_count (yabai -m query --displays | jq length)

  # Get the space on the passed index
  set space (yabai -m query --spaces --space $idx 2>/dev/null)

  # Create space if it doesn't exist
  if test -z "$space"
    yabai -m space --create
  end
end
