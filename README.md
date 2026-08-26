# Dotfiles

Public configuration for my macOS development environment, managed with
[yadm](https://yadm.io/).

## What is included

- **Shell:** fish with Starship, zoxide, and fzf
- **Terminals:** Ghostty, WezTerm, and Warp
- **Editors:** Neovim, Zed, and JetBrains IDEs
- **Desktop tools:** AeroSpace and Raycast
- **Tooling:** Homebrew, Mise, GitHub CLI, pnpm, Bun, and uv
- **Appearance:** Gruvbox Dark with JetBrains Mono

The [Brewfile](Brewfile) is the source of truth for installed packages and
applications. Configuration lives at the same paths where each tool expects it
under `$HOME`.

## Set up a new Mac

1. Install Apple's Command Line Tools:

   ```sh
   xcode-select --install
   ```

2. Install Homebrew and follow the shell setup instructions printed by the
   installer:

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Install yadm and clone the dotfiles into `$HOME`:

   ```sh
   brew install yadm
   yadm clone https://github.com/christofferbergj/dotfiles.git
   ```

   Use the SSH remote after GitHub authentication is configured:

   ```sh
   yadm remote set-url origin git@github.com:christofferbergj/dotfiles.git
   ```

4. Install the packages and applications:

   ```sh
   brew bundle --file="$HOME/Brewfile"
   brew bundle check --file="$HOME/Brewfile"
   ```

5. Restore the agent skills recorded in the lockfile:

   ```sh
   cd "$HOME"
   npx skills experimental_install
   ```

6. Make fish the login shell, then restart the terminal:

   ```sh
   fish_path="$(command -v fish)"
   grep -Fxq "$fish_path" /etc/shells || echo "$fish_path" | sudo tee -a /etc/shells
   chsh -s "$fish_path"
   ```

## Local secrets

Secrets and machine-specific values belong in the ignored file
`~/.config/local/env.fish`, never in tracked configuration.

Use standard fish exports for terminal-only values:

```fish
set -gx EXAMPLE_API_KEY "..."
```

For values needed by GUI-launched applications, use the helper provided while
the file is loaded:

```fish
set_gui_env EXAMPLE_GUI_TOKEN "..."
```

Restart affected GUI applications after changing their environment.

## Maintain the dotfiles

yadm uses `$HOME` as its Git work tree, so edit the live files in place and use
yadm for version-control operations:

```sh
yadm status
yadm diff
yadm add ~/.config/example/config
yadm commit
yadm pull --rebase
yadm push
```

Stage exact paths and review the diff before committing. Keep credentials,
generated files, caches, and machine-local state ignored.
