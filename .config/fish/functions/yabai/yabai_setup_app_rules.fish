function yabai_setup_app_rules -d "Setup app rules for yabai"
    set -l opacity 0.95

    # Browser
    yabai -m rule --add app='^Brave Browser$' space='^browser'
    # yabai -m rule --add app='^Arc$' space='^browser'
    # yabai -m rule --add app='^Google Chrome$' space='^other'
    # yabai -m rule --add app='^Safari$' space='^other'
    # yabai -m rule --add app='^Firefox$' space='^other'

    # Terminal
    yabai -m rule --add app='^WezTerm$' space='^terminal' opacity=$opacity

    # Editor (WebStorm, Zed and VSCode)
    yabai -m rule --add app='Code$' space='^editor' opacity=0.98
    yabai -m rule --add app='WebStorm$' space='^editor' opacity=$opacity
    yabai -m rule --add app='WebStorm-EAP$' space='^editor' opacity=$opacity
    yabai -m rule --add app='Zed$' space='^editor' opacity=$opacity
    yabai -m rule --add app='WebStorm$' title='^Rename|Run|Move|Copy|Problems Detected|Delete|Usages Detected|Settings|Conflicts|Rollback Changes|Find Usages|Extract Variable|Go to Line:Column|Conflicts|Merge Revisions.*$' manage=off opacity=$opacity
    yabai -m rule --add app='WebStorm-EAP$' title='^Rename|Run|Move|Copy|Problems Detected|Delete|Usages Detected|Settings|Conflicts|Rollback Changes|Find Usages|Extract Variable|Go to Line:Column|Conflicts|Merge Revisions.*$' manage=off opacity=$opacity

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

    # Mail
    yabai -m rule --add app='^Spark$' space='^mail'
    yabai -m rule --add app='^Spark$' title='^New Message$' space='^mail' manage=off
    yabai -m rule --add app='^Spark Desktop$' space='^mail'

    # Design tools
    yabai -m rule --add app='^Figma$'

    # Don't manage
    yabai -m rule --add app='^Rewind$' manage=off
    yabai -m rule --add app='^CleanShot X$' manage=off
    yabai -m rule --add app='^Activity Monitor$' manage=off
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

    # Apply all rules
    yabai -m rule --apply
end
