function init_gruvbox -d 'Initialize Gruvbox color scheme'
  # Gruvbox Color Palette
  set -l fg ebdbb2
  set -l fg0 fbf1c7
  set -l fg1 ebdbb2
  set -l fg2 d5c4a1
  set -l fg3 bdae93
  set -l fg4 a89984

  set -l bg 282828
  set -l bg0 282828
  set -l bg1 3c3836
  set -l bg2 504945
  set -l bg3 665c54
  set -l bg4 7c6f64

  set -l gray a89984
  set -l gray_dark 928374

  set -l red fb4934
  set -l red_dark cc241d

  set -l orange fe8019
  set -l orange_dark d65d0e

  set -l yellow fabd2f
  set -l yellow_dark d79921

  set -l green b8bb26
  set -l green_dark 98971a

  set -l purple d3869b
  set -l purple_dark b16286

  set -l aqua 8ec07c
  set -l aqua_dark 689d6a

  set -l blue 83a598
  set -l blue_dark 458588

  # Syntax Highlighting Colors
  set -g fish_color_normal $fg
  set -g fish_color_command $aqua
  set -g fish_color_keyword $blue
  set -g fish_color_quote $yellow
  set -g fish_color_redirection $fg
  set -g fish_color_end $orange
  set -g fish_color_error $red
  set -g fish_color_param $fg
  set -g fish_color_option $orange
  set -g fish_color_comment $purple_dark
  set -g fish_color_selection --background=$fg4
  set -g fish_color_search_match --background=$fg4
  set -g fish_color_operator $green
  set -g fish_color_escape $blue
  set -g fish_color_autosuggestion $bg4

  # Completion Pager Colors
  set -g fish_pager_color_progress $purple_dark
  set -g fish_pager_color_prefix $aqua
  set -g fish_pager_color_completion $fg
  set -g fish_pager_color_description $purple_dark
end
