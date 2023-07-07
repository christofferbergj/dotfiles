# Dotfiles, cli tools and apps

Repo for my configuration files and list of applications.

## Quick overview

**Operating system**  
MacOS 

**Terminal**  
WezTerm

**Editor**  
Neovim + WebStorm

**Window manager**  
Yabai + Skhd

**Launcher**  
Raycast

**Theme**  
Gruvbox Medium Dark

## Screenshots

### WebStorm in Typescript file

![WebStorm editor in typescript file](https://user-images.githubusercontent.com/10507071/227624576-b1731361-32f0-41ad-9644-185c18aae949.png)


### Neovim in TypeScript file

![Neovim editor in typescript file](https://user-images.githubusercontent.com/10507071/227624572-2222e339-0f70-470d-9127-52351eb64a36.png)

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

1. Install Homebrew
2. Install Fish shell
3. Install apps
4. Install cli tools
5. Install fonts
6. Setup and add Github SSH keys with `gh`. Add to ssh-agent afterwards.

## Homebrew

Install Homebrew  
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Fish shell

Install Fish  
```bash
brew install fish
```

More info: https://fishshell.com/docs/current/tutorial.html#tut_path

**Check the path**

Check the fish path with `which fish`. Most likely: `/opt/homebrew/bin/fish`. 
On older Macs default path is `/usr/local/bin/fish`, replace accordingly in the instruction below.

**Make `fish` the default**

* Check the fish path with which fish.
* Add fish to know shells: `sudo sh -c 'echo (which fish) >> /etc/shells'`
* Restart the terminal
* Set fish as the default shell: `chsh -s (which fish)`
* Restart the terminal and check if it launched with fish or not
* Add brew binaries in fish path: `fish_add_path /opt/homebrew/bin`

**Optionally configure the shell (launch web interface)**

`fish_config`

## Font

`brew tap homebrew/cask-fonts`  
`brew install --cask font-jetbrains-mono`

## CLI tools

* fish shell – `brew install fish`
* starship – `brew install starship`
* nvim – `brew install neovim`
* rar – `brew install rar`
* fzf – `brew install fzf`
* fd – `brew install fd`
    * `abbr find fd`
* gh – `brew install gh`
* tldr – `brew install tldr`
* ripgrep – `brew install ripgrep`
    * `abbr grep rg`
* git – `brew install git`
* bat – `brew install bat`
* yabai – `brew install koekeishiya/formulae/yabai`
* skhd – `brew install koekeishiya/formulae/skhd`
* ugit – `brew install ugit`
* jq – `brew install jq`
* gitui – `brew install gitui`
  * `abbr g gitui`
* yadm – `brew install yadm`
    * `abbr ys 'yadm status'`
    * `abbr ya 'yadm add'`
    * `abbr yc 'yadm commit'`
    * `abbr yd 'yadm diff'`
    * `abbr yp 'yadm push'`
* zoxide – `brew install zoxide`
  * `abbr j z`
* exa – `brew install exa`
    * `abbr ll 'exa -la'`
* n – `brew install n`
  * `set -Ux N_PREFIX ~/.n`
  * `fish_add_path -m ~/.n/bin`


## Apps

* wezterm (terminal) – `brew install --cask wezterm`
* fig (cli helper) – `brew install --cask fig`
* raycast (launcher) – `brew install --cask raycast`
* karabiner-elements (keyboard remapping) – `brew install --cask karabiner-elements`
* alt-tab (window switcher) – `brew install --cask alt-tab`
* hiddenbar – `brew install --cask hiddenbar`
* spark (email client) – `brew install --cask readdle-spark`
* rocket – `brew install --cask rocket`
* cleanshot x – `brew install --cask cleanshot`
* jetbrains toolbox – `brew install --cask jetbrains-toolbox`
* google drive – `brew install --cask google-drive`
* spotify – `brew install --cask spotify`
* betterdisplay – `brew install --cask betterdisplay`
* grammarly desktop – `brew install --cask grammarly-desktop`
* spaceid – `brew install --cask spaceid`
* notion – `brew install --cask notion`
* todoist – `brew install --cask todoist`
* bitwarden – `brew install --cask bitwarden`

### All apps install command
`brew install --cask wezterm fig raycast karabiner-elements alt-tab hiddenbar readdle-spark rocket cleanshot jetbrains-toolbox google-drive spotify betterdisplay grammarly-desktop spaceid notion todoist bitwarden`

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
