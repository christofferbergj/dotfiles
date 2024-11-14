function yabai_init_spaces -d "Initialize spaces based on display count"
    # Get current display count
    set -l display_count (yabai -m query --displays | jq length)

    # Define base space labels (for single display)
    set -l base_labels "browser" "terminal" "editor" "messages" "media" "mail" "notes" "junk"

    # Get current spaces count and configuration
    set -l current_spaces (yabai -m query --spaces | jq length)
    set -l target_spaces 8 # default for single display

    switch $display_count
        case 1
            set target_spaces 8
        case 2
            set target_spaces 9
        case 3
            set target_spaces 10
    end

    # Adjust space count if needed
    if test $current_spaces -gt $target_spaces
        # Remove excess spaces
        set -l spaces_to_remove (math $current_spaces - $target_spaces)
        for i in (seq $current_spaces -1 (math $target_spaces + 1))
            yabai -m space $i --destroy
        end
    else if test $current_spaces -lt $target_spaces
        # Add needed spaces
        set -l spaces_to_add (math $target_spaces - $current_spaces)
        for i in (seq 1 $spaces_to_add)
            yabai -m space --create
        end
    end

    # Label and arrange spaces based on display count
    switch $display_count
        case 1
            # Single display: 8 spaces
            for i in (seq 1 8)
                yabai -m space $i --label $base_labels[$i]
            end

        case 2
            # Two displays: 9 spaces (8 on main + "other" on second)
            for i in (seq 1 8)
                yabai -m space $i --label $base_labels[$i]
            end
            yabai -m space 9 --label "other"
            yabai -m space 9 --display 2

        case 3
            # Three displays: 10 spaces
            for i in (seq 1 8)
                yabai -m space $i --label $base_labels[$i]
            end
            yabai -m space 9 --label "other"
            yabai -m space 10 --label "extra"
            yabai -m space 9 --display 2
            yabai -m space 10 --display 3
    end

    # Wait for spaces to settle
    sleep 1

    # Apply window rules
    yabai_setup_app_rules

    # Wait for rules to settle
    sleep 1

    # Focus on terminal space
    yabai -m space --focus "terminal" 2>/dev/null

    # Show final space configuration
    yabai_get_spaces
end
