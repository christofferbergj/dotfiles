# Dotfiles

Public dotfiles for my macOS setup, managed with [yadm](https://yadm.io/).

## Overview

**Operating system**
macOS

**Terminal**
Ghostty, WezTerm, and Warp

**Shell**
fish

**Editor**
Neovim, Zed, and JetBrains IDEs

**Window manager**
AeroSpace

**Launcher**
Raycast

**Theme**
Gruvbox Medium Dark

## Screenshots

### WebStorm in TypeScript file

![WebStorm editor in TypeScript file](https://github.com/christofferbergj/dotfiles/assets/10507071/382ec3bd-5f53-4cd0-96bd-a9e8be88999c)

### Neovim in TypeScript file

![Neovim editor in TypeScript file](https://github.com/christofferbergj/dotfiles/assets/10507071/ceb605f9-9b3e-4215-a0d0-0ddf0cdc4987)

## Fresh macOS setup

### 1. Install Command Line Tools

```bash
xcode-select --install
```

Homebrew requires Apple's Command Line Tools or Xcode.

### 2. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, follow the shell setup lines printed by Homebrew. On Apple Silicon that is usually:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

On Intel Macs the Homebrew prefix is usually `/usr/local`.

### 3. Install yadm and clone dotfiles

```bash
brew install yadm
yadm clone git@github.com:christofferbergj/dotfiles.git
```

Use the HTTPS URL instead if SSH keys are not configured yet:

```bash
yadm clone https://github.com/christofferbergj/dotfiles.git
```

### 4. Install apps and CLI tools

```bash
brew bundle --file="$HOME/Brewfile"
```

Check whether the machine matches the Brewfile with:

```bash
brew bundle check --file="$HOME/Brewfile"
```

### 5. Configure fish as the login shell

The Brewfile installs fish. Confirm the path first:

```bash
command -v fish
```

Then add fish to the list of allowed login shells and switch to it:

```bash
command -v fish | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"
```

Restart the terminal afterwards. fish automatically loads `~/.config/fish/config.fish` and files in `~/.config/fish/conf.d/`.

### 6. Configure GitHub SSH

```bash
gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub
```

Create an SSH key first if one does not exist yet.

## Fonts

Fonts are installed from the Brewfile. To install one manually:

```bash
brew install --cask font-jetbrains-mono
```

## Local secrets

Secrets do not belong in this public repository. Machine-local values are loaded from ignored files such as:

- `~/.config/codex/env.fish`

## Raycast extensions

Currently installed extensions detected from the local Raycast setup:

- Apple Reminders
- Coffee
- Color Picker
- GitHub
- Kill Process
- Port Manager
- Ray.so
- Sips
- Speedtest
