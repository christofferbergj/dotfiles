function yabai_setup_spaces
  set -l space_labels "browser" "terminal" "editor" "messages" "media" "mail" "notes" "junk" "other"
  set -l total_spaces (count $space_labels)

  for i in (seq 1 $total_spaces)
    yabai_setup_space $i $space_labels[$i]
  end
end
