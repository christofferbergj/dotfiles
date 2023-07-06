# Setup a single space
function yabai_setup_space
  set idx $argv[1]
  set name $argv[2]

  # Get the space on the passed index
  set space (yabai -m query --spaces --space $idx 2>/dev/null)

  # Create space if it doesn't exist
  if test -z "$space"
    yabai -m space --create
  end

  # Get the space on the passed index
  yabai -m space $idx --label $name
end
