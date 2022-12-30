# Dotfiles, cli tools and apps

Repo for my configuration files and applications.

## Screenshots

![Neovim editor](https://user-images.githubusercontent.com/10507071/210084278-3849c000-f9a7-4cf7-ba95-3ec992c5abd4.png)


<details>
<summary>More screenshots</summary>

### Neovim dashboard

![Neovim dashboard](https://user-images.githubusercontent.com/10507071/210083588-a54da17b-c2f3-42e2-9802-1d66b90183c5.png)


### Telescope

![Telescope](https://user-images.githubusercontent.com/10507071/210084081-d6a2e9ac-baba-46fa-9447-ffd521ba2de4.png)
![TeleScope](https://user-images.githubusercontent.com/10507071/210083952-1ad8568f-8aac-424c-961e-9767bc5cf4a3.png)


### Lua

![Lua](https://user-images.githubusercontent.com/10507071/210084163-c7b00ef5-ee74-49e6-b60a-145690dc6bb1.png)


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
