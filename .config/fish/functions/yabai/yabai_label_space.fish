# Label a single space
function yabai_label_space -d "Label a single space"
  set -l idx $argv[1]
  set -l label $argv[2]

  # Get the space on the passed index
  set space (yabai -m query --spaces --space $idx 2>/dev/null)

  if test -z "$space"
    echo "Space $idx does not exist"
    return
  end

  yabai -m space $idx --label $label
end
