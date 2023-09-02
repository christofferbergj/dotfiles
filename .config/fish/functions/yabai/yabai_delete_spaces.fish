# Delete all spaces
function yabai_delete_spaces -d "Delete all spaces"
  echo "Deleting all spaces"
  sleep 0.5
  set -l display_ids (yabai -m query --displays | jq -r '.[].index')

  for display_id in $display_ids
      set -l space_ids (yabai -m query --spaces --display $display_id | jq -r '.[].index')
      set -l space_count (count $space_ids)

      if test $space_count -gt 1
          for index in (seq $space_count -1 2)
              yabai -m space --destroy (echo $space_ids[$index])
          end
      end
  end
end
