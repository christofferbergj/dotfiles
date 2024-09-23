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

![WebStorm editor in typescript file](https://github.com/christofferbergj/dotfiles/assets/10507071/382ec3bd-5f53-4cd0-96bd-a9e8be88999c)

### Neovim in TypeScript file

![Neovim editor in typescript file](https://github.com/christofferbergj/dotfiles/assets/10507071/ceb605f9-9b3e-4215-a0d0-0ddf0cdc4987)

## General info

1. Install Homebrew
2. Install Fish shell
3. Install apps and CLI tools (Brewfile)
4. Install fonts
5. Setup and add Github SSH keys with `gh`. Add to ssh-agent afterwards.

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

- Check the fish path with which fish.
- Add fish to know shells: `sudo sh -c 'echo (which fish) >> /etc/shells'`
- Restart the terminal
- Set fish as the default shell: `chsh -s (which fish)`
- Restart the terminal and check if it launched with fish or not
- Add brew binaries in fish path: `fish_add_path /opt/homebrew/bin`

**Optionally configure the shell (launch web interface)**

`fish_config`

## Font

`brew tap homebrew/cask-fonts`  
`brew install --cask font-jetbrains-mono`

## Apps

See Brewfile

## Raycast extensions

- bitwarden vault
- brew
- github
- google workspace
- hacker news
- bookmarks
- translate
- slack status
- word search
- speedtest
- tailwindcss
- search mdn
- notion
- placeholder
- generate random data
- lorem ipsum
