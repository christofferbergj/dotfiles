# This function adds the yabai scripting addition to the sudoers file, allowing yabai to be executed with elevated privileges without requiring a password.
# It also outputs the contents of the sudoers file using the bat command.
function yabai_add_scripting_addition -d "Adds the yabai scripting addition to the sudoers file."
    if not test -x (which yabai)
        echo (set_color red)"Error: yabai binary not found"(set_color normal)
        return 1
    end

    echo (set_color yellow)"Adding yabai scripting addition to sudoers file..."(set_color normal)
    echo (whoami) ALL = \(root\) NOPASSWD: sha256:(shasum -a 256 (which yabai) | awk '{print $1}') (which yabai) --load-sa | sudo tee /private/etc/sudoers.d/yabai > /dev/null

    if test $status -eq 0
        echo (set_color green)"Scripting addition added to sudoers file successfully."(set_color normal)
        echo
        echo (set_color magenta)"Outputting the file via bat:"(set_color normal)
        sudo bat /private/etc/sudoers.d/yabai
    else
        echo (set_color red)"Error: Failed to add yabai scripting addition to sudoers file."(set_color normal)
    end
end
