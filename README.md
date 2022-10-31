# dotfiles and apps

Repo for my configuration files and applications.

## General info

* Setup and add Github SSH keys with `gh`. Add to ssh-agent afterwards.  
* Install `tj/n` through brew, and make sure the `N_PREFIX` variable export exists within fish_config.  
* Make sure to delete `SETUVAR fish_user_paths` line from `.config/fish/fish_variables` before copying over.

## Fish shell

Install Fish

`brew install fish`

More info: https://fishshell.com/docs/current/tutorial.html#tut_path

**Check the path**

Check the fish path with `which fish`. In the examples below it was located at: `/opt/homebrew/bin/fish`. 
On older Macs default path is `/usr/local/bin/fish`, replace accordingly in the instruction below.

**Make `fish` the default**

* Check the fish path with which fish. In the examples below it was located at: /opt/homebrew/bin/fish. On older Macs these paths might differ.
* Add fish to the know shells run the command: `sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'`
* Restart the terminal
* Set fish as the default shell run the command: `chsh -s /opt/homebrew/bin/fish`
* Restart the terminal and check if it launched with fish or not
* Add brew binaries in fish path run the command: `set -U fish_user_paths /opt/homebrew/bin $fish_user_paths`

**Optionally configure the shell (launch web interface)**

`fish_config`



## Font
`brew tap homebrew/cask-fonts`  
`brew install --cask font-jetbrains-mono-nerd-font`

## CLI tools

* fish shell
* starship
* yadm
* nvim
* rar
* autojump
* fzf
* exa
* fd
* gh
* gitui
* n
* tldr
* ripgrep
* git
* bat
* yabai
* skhd
* ugit
* jq


## Apps

* fig
* raycast
* karabiner-elements
* alt-tab
* hiddenbar
* spark
* rocket
* cleanshot x
* jetbrains toolbox
* google drive
* iterm
* spotify
* monitorcontrol
* grammarly desktop
* spaceid
* notion
* todoist

## Raycast extensions

* bitwarden vault
* brew
* gitHub
* google workspace
* hacker news 
* bookmarks
* translate
* slack status
* word search
* speedtest
* tailwindcss
* search npm
* search mdn
* notion
* placeholder
* generate random data
* lorem ipsum
