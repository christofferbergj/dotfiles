function yabai_setup_spaces
  set -l space_labels "browser" "terminal" "editor" "messages" "media" "mail" "notes" "junk" "other"
  set -l total_spaces (count $space_labels)

  echo "Setting up $total_spaces spaces"
  for i in (seq 1 $total_spaces)
    yabai_setup_space $i
  end

  sleep 0.5

  echo "Labeling newly created spaces"
  for i in (seq 1 $total_spaces)
    yabai_label_space $i $space_labels[$i]
  end

  sleep 0.5

  fish -c yabai_get_spaces
end
