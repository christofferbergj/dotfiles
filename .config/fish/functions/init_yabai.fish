function init_yabai
  # Delete all spaces
  yabai_delete_spaces

  # Setup spaces
  yabai_setup_spaces

  # Setup app rules
  yabai_setup_app_rules

  # Focus on terminal space
  yabai -m space --focus "terminal" 2>/dev/null

  echo
  echo "Yabai initialisation complete ✨"
end
