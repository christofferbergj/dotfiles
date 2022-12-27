# Dotfiles, cli tools and apps

Repo for my configuration files and applications.

## Screenshots

![Neovim editor](https://user-images.githubusercontent.com/10507071/209715862-1437e36d-874c-439a-bcb2-dba439e056bf.png)


<details>
<summary>More screenshots</summary>

### Neovim dashboard

![Neovim dashboard](https://user-images.githubusercontent.com/10507071/209714484-7b6b8f61-9072-4906-89aa-487445209e81.png)

### Telescope

![TeleScope](https://user-images.githubusercontent.com/10507071/209715699-1a418964-b373-45a1-bc32-80a689e6dd7b.png)


### Lua

![Lua](https://user-images.githubusercontent.com/10507071/209715051-92a02502-5921-47ae-8986-e168c2ac6a9f.png)

</details>

## General info

* Setup and add Github SSH keys with `gh`. Add to ssh-agent afterwards.  

## Fish shell

Install Fish

`brew install fish`

More info: https://fishshell.com/docs/current/tutorial.html#tut_path

**Check the path**

Check the fish path with `which fish`. In the examples below it was located at: `/opt/homebrew/bin/fish`. 
On older Macs default path is `/usr/local/bin/fish`, replace accordingly in the instruction below.

**Make `fish` the default**

* Check the fish path with which fish.
* Add fish to the know shells run the command: `sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'`
* Restart the terminal
* Set fish as the default shell run the command: `chsh -s /opt/homebrew/bin/fish`
* Restart the terminal and check if it launched with fish or not
* Add brew binaries in fish path run the command: `set -U fish_user_paths /opt/homebrew/bin $fish_user_paths`

**Optionally configure the shell (launch web interface)**

`fish_config`

## Font

`brew tap homebrew/cask-fonts`  
`brew install --cask font-jetbrains-mono`

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

* wezterm
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
