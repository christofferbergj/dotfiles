function yabai_setup_app_rules -d "Setup app rules for yabai"
  set -l opacity 0.93

  # Browser
  yabai -m rule --add app='^Brave Browser$' space='^browser'
  yabai -m rule --add app='^Google Chrome$' space='^other'
  yabai -m rule --add app='^Safari$' space='^other'
  yabai -m rule --add app='^Firefox$' space='^other'

  # Terminal
  yabai -m rule --add app='^WezTerm$' space='^terminal' opacity=$opacity

  # Editor (WebStorm and VSCode)
  yabai -m rule --add app='Code$' space='^editor' opacity=$opacity
  yabai -m rule --add app='WebStorm$' space='^editor' opacity=$opacity
  yabai -m rule --add app='WebStorm$' title='^Rename|Move|Copy|Problems Detected|Delete|Usages Detected|Settings|Conflicts|Rollback Changes|Find Usages|Extract Variable$' manage=off opacity=$opacity

  # Messages
  yabai -m rule --add app='^Messenger$' space='messages' manage=off
  yabai -m rule --add app='^Slack$' space='messages'

  # Notes
  yabai -m rule --add app='^Notion$' space='^notes'
  yabai -m rule --add app='^Todoist$' space='^notes'
  yabai -m rule --add app='^Notes$' space='^notes' opacity=$opacity

  # Media
  yabai -m rule --add app='^Spotify$' space='media'
  yabai -m rule --add app='^Sonos$' space='^media'
  yabai -m rule --add app='^Podcasts$' space='^media'
  yabai -m rule --add app='^Endel$' space='^media'

  # Mail
  yabai -m rule --add app='^Spark$' space='^mail'
  yabai -m rule --add app='^Spark$' title='^New Message$' space='^mail' manage=off
  yabai -m rule --add app='^Spark Desktop$' space='^mail'

  # Design tools
  yabai -m rule --add app='^Figma$' space='^other'

  # Don't manage
  yabai -m rule --add app='^Rewind$' manage=off
  yabai -m rule --add app='^CleanShot X$' manage=off
  yabai -m rule --add app='^Finder$' manage=off
  yabai -m rule --add app='^AltTab$' manage=off
  yabai -m rule --add app='^Reminders$' manage=off
  yabai -m rule --add app='^System Settings$' manage=off
  yabai -m rule --add app='^Archive Utility$' manage=off
  yabai -m rule --add app='^Raycast$' manage=off
  yabai -m rule --add app='^JetBrains Toolbox$' manage=off
  yabai -m rule --add app='^Hidden Bar$' manage=off
  yabai -m rule --add app='^Homerow$' manage=off
  yabai -m rule --add app='^Rocket$' manage=off
  yabai -m rule --add app='^MonitorControl$' manage=off
  yabai -m rule --add app='^MeetingBar$' manage=off
end
