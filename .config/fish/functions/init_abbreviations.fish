function init_abbreviations -d 'Initialize fish abbreviations'
  # general (cli tools)
  abbr --add c. 'code .'
  abbr --add cat 'bat'
  abbr --add j 'z'
  abbr --add kp 'pnpm dlx kill-port 3000 3001 4000 6006 5173'
  abbr --add killport 'pnpm dlx kill-port 3000 3001 4000 6006 5173'

  # homebrew (package manager)
  abbr --add b 'brew'
  abbr --add bu 'brew upgrade'
  abbr --add buc 'brew upgrade ; brew cleanup ; brew autoremove'
  abbr --add bi 'brew install'
  abbr --add bic 'brew install --cask'
  abbr --add br 'brew remove'
  abbr --add brm 'brew remove'
  abbr --add bclean 'brew cleanup --prune=all ; brew autoremove'
  abbr --add bc 'brew cleanup --prune=all ; brew autoremove'
  abbr --add bs 'brew search'
  abbr --add bl 'brew list'
  abbr --add bsc 'brew search --cask'

  # ollama commit message generation
  abbr --add aic ollama_commit_msg

  # gh (github cli)
  abbr --add gho 'gh repo view -w'
  abbr --add ghp 'gh pr view -w'
  abbr --add ghpc 'gh pr create -f'
  abbr --add ghpca 'gh pr create -f; and gh pr view -w'
  abbr --add ghpcd 'gh pr create -f -d'
  abbr --add ghw 'gh workflow view -w'

  # gitui
  abbr --add g 'gitui'

  # git
  abbr --add yolo 'git add --all ; git commit -m "¯\_(ツ)_/¯"'
  abbr --add s 'git status -s'
  abbr --add ga 'git add'
  abbr --add gaa 'git add --all'
  abbr --add gap 'git apply'
  abbr --add gapa 'git add --patch'
  abbr --add gau 'git add --update'
  abbr --add gb 'git branch -vv'
  abbr --add gbD 'git branch -D'
  abbr --add gbad 'git branch -v | rg "\[gone\]" | awk "{print \$1}" | string trim -l | xargs -L 1 git branch -D'
  abbr --add gba 'git branch -a -v'
  abbr --add gban 'git branch -a -v --no-merged'
  abbr --add gbd 'git branch -d'
  abbr --add gbl 'git blame -b -w'
  abbr --add gbs 'git bisect'
  abbr --add gc 'git commit -v'
  abbr --add gc! 'git commit -v --amend'
  abbr --add gc- 'git checkout -'
  abbr --add gca 'git commit -v -a'
  abbr --add gca! 'git commit -v --addamend'
  abbr --add gcam 'git commit -a -m'
  abbr --add gcan! 'git commit -v --addno-edit --amend'
  abbr --add gcav 'git commit -a -v --no-verify'
  abbr --add gcav! 'git commit -a -v --no-verify --amend'
  abbr --add gcb 'git checkout -b'
  abbr --add gce 'git commit --allow-empty -m "trigger deployment" --no-verify'
  abbr --add gcf 'git config --list'
  abbr --add gcfx 'git commit --fixup'
  abbr --add gcl 'git clone'
  abbr --add gclean 'git clean -di'
  abbr --add gclean! 'git clean -dfx'
  abbr --add gclean!! 'git reset --hard; and git clean -dfx'
  abbr --add gcm 'git commit -m'
  abbr --add gcn 'git commit -v -n'
  abbr --add gcn! 'git commit -v --no-edit --amend'
  abbr --add gco 'git checkout'
  abbr --add gcp 'git cherry-pick'
  abbr --add gcpa 'git cherry-pick --abort'
  abbr --add gcpc 'git cherry-pick --continue'
  abbr --add gcv 'git commit -v --no-verify'
  abbr --add gd 'git diff'
  abbr --add gf 'git fetch'
  abbr --add gfa 'git fetch --all --prune'
  abbr --add gfo 'git fetch origin'
  abbr --add ggp! 'ggp --force-with-lease'
  abbr --add gignore 'git update-index --assume-unchanged'
  abbr --add gl 'git pull'
  abbr --add glg 'git log --stat'
  abbr --add glgg 'git log --graph'
  abbr --add glgga 'git log --graph --decorate --all'
  abbr --add gll 'git pull origin'
  abbr --add glr 'git pull --rebase'
  abbr --add gm 'git merge'
  abbr --add gp 'git push'
  abbr --add gp! 'git push --force-with-lease'
  abbr --add gpl 'git pull'
  abbr --add gplf 'git pull ; git fetch --all --prune'
  abbr --add gpo 'git push origin'
  abbr --add gpo! 'git push --force-with-lease origin'
  abbr --add gpu 'git push --set-upstream'
  abbr --add gpv 'git push --no-verify'
  abbr --add gpv! 'git push --no-verify --force-with-lease'
  abbr --add gr 'git remote -vv'
  abbr --add gra 'git remote add'
  abbr --add grb 'git rebase'
  abbr --add grhh 'git reset head --hard'
  abbr --add gruh 'git fetch origin; and git reset --hard origin/(git symbolic-ref --short HEAD)'
  abbr --add grst 'git restore --staged'
  abbr --add grv 'git remote -v'
  abbr --add gs 'git status -s'
  abbr --add gst 'git stash'
  abbr --add gsta 'git stash apply'
  abbr --add gsw 'git switch'
  abbr --add gswc 'git switch -c'

  # eza
  abbr --add l 'eza -a -1 --git --icons'
  abbr --add ld 'eza -D -1 --git --icons'
  abbr --add la 'eza -a -l --git --icons'
  abbr --add ll 'eza -a -l --git --icons'

  # npm
  abbr --add ni 'npm install'
  abbr --add no 'npm outdated'
  abbr --add nr 'npm remove'
  abbr --add nu 'npm update'
  abbr --add nci 'npm ci'
  abbr --add nru 'npm run'
  abbr --add nclean 'rm -rf package-lock.json node_modules/; npm install'

  # neovim
  abbr --add nv nvim
  abbr --add v nvim

  # pnpm
  abbr --add p pnpm
  abbr --add pa 'pnpm add'
  abbr --add pd 'pnpm dev'
  abbr --add pi 'pnpm install'
  abbr --add pb 'pnpm build'
  abbr --add pl 'pnpm list'
  abbr --add po 'pnpm outdated'
  abbr --add pr 'pnpm run'
  abbr --add pre 'pnpm remove'
  abbr --add prm 'pnpm rm'
  abbr --add pu 'pnpm update'
  abbr --add px 'pnpm dlx'

  # Raycast
  abbr rgcm 'git diff | pbcopy; open raycast://ai-commands/git-commit-message'

  # Zed
  abbr --add z. 'zed .'

  # webstorm
  abbr --add ws 'open -a WebStorm'
  abbr --add ws. 'open -a WebStorm .'

  # yabai and skhd
  abbr --add yb 'nvim ~/.config/yabai/yabairc'
  abbr --add ybs 'nvim ~/.config/skhd/skhdrc'

  # yadm dotfiles manager
  abbr --add y 'yadm'
  abbr --add ya 'yadm add'
  abbr --add yc 'yadm commit'
  abbr --add ycm 'yadm commit -m'
  abbr --add yd 'yadm diff'
  abbr --add yp 'yadm push'
  abbr --add ys 'yadm status'
end
