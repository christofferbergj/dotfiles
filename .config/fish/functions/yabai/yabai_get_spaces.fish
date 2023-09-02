# function yabai_get_spaces
#
# Returns a list of spaces in the current macOS window layout.
#
# Parameters:
#     None
#
# Returns:
#     A list of strings in the format "index: label", where index is the numerical index of the space and label is the user-defined label of the space.
#
# Example:
#     yabai_get_spaces
#     > 0: Main
#     > 1: Development
#     > 2: Music
#
function yabai_get_spaces -d "Returns a list of spaces in the current macOS window layout."
    set -l spaces (yabai -m query --spaces | jq -rc '.[]')

    for space in $spaces
        set -l index (echo $space | jq -r '.index')
        set -l label (echo $space | jq -r '.label')

        echo "$index: $label"
    end
end
