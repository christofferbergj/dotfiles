function init_abbreviations -d 'Initialize fish abbreviations'
    # general (cli tools)
    abbr --add c. 'code .'
    abbr --add cat bat
    abbr --add j z
    abbr --add kp 'pnpm dlx kill-port 3000 3001 4000 6006 5173'
    abbr --add killport 'pnpm dlx kill-port 3000 3001 4000 6006 5173'

    # homebrew (package manager)
    abbr --add b brew
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
    abbr --add ghpl 'gh pr list'
    abbr --add ghpc 'gh pr create -f'
    abbr --add ghpma 'gh pr merge --merge --squash'
    abbr --add ghpca 'gh pr create -f; and gh pr view -w'
    abbr --add crp 'gh pr create --title "@coderabbitai" --body "@coderabbitai summary" ; gh pr view -w'
    abbr --add ghpcd 'gh pr create -f -d'
    abbr --add ghw 'gh workflow view -w'

    # gitui
    abbr --add g gitui

    # git
    abbr --add gg "git pull ; git fetch --all --prune ; git branch -v | rg '\[gone\]' | awk '{print \$1}' | string trim -l | xargs -L 1 git branch -D"
    abbr --add ggr "git pull --rebase ; git fetch --all --prune ; git branch -v | rg '\[gone\]' | awk '{print \$1}' | string trim -l | xargs -L 1 git branch -D"
    abbr --add gbad "git branch -v | rg '\[gone\]' | awk '{print \$1}' | string trim -l | xargs -L 1 git branch -D"
    abbr --add fomo 'git fetch --all --prune; and git rebase origin/main'
    abbr --add grm 'git fetch --all --prune; and git rebase origin/main'
    abbr --add grbm 'git fetch --all --prune; and git rebase origin/main'
    abbr --add yolo 'git add --all ; git commit -m "¯\_(ツ)_/¯"'
    abbr --add s 'git status -s'
    abbr --add ga 'git add'
    abbr --add gaa 'git add --all'
    abbr --add gap 'git apply'
    abbr --add gb 'git branch -vv'
    abbr --add gbD 'git branch -D'
    abbr --add gba 'git branch -a -v'
    abbr --add gban 'git branch -a -v --no-merged'
    abbr --add gbd 'git branch -d'
    abbr --add gc 'git commit -v'
    abbr --add gc! 'git commit -v --amend'
    abbr --add gca 'git commit -v -a'
    abbr --add gce 'git commit --allow-empty -m "Trigger deployment" --no-verify'
    abbr --add gcl 'git clone'
    abbr --add gcm 'git commit -m'
    abbr --add gcn 'git commit -v -n'
    abbr --add gcn! 'git commit -v --no-edit --amend'
    abbr --add gco 'git checkout'
    abbr --add gcp 'git cherry-pick'
    abbr --add gd 'git diff'
    abbr --add gfa 'git fetch --all --prune'
    abbr --add gignore 'git update-index --assume-unchanged'
    abbr --add glr 'git pull --rebase'
    abbr --add gm 'git merge'
    abbr --add gp 'git push'
    abbr --add gp! 'git push --force-with-lease'
    abbr --add gpl 'git pull'
    abbr --add gplf 'git pull ; git fetch --all --prune'
    abbr --add gpu 'git push --set-upstream'
    abbr --add gr 'git rebase'
    abbr --add grb 'git rebase'
    abbr --add gra 'git rebase --abort'
    abbr --add grba 'git rebase --abort'
    abbr --add grc 'git rebase --continue'
    abbr --add grac 'git rebase --continue'
    abbr --add grr 'git rebase --rerere-autoupdate'
    abbr --add grhh 'git reset head --hard'
    abbr --add gruh 'git fetch origin; and git reset --hard origin/(git symbolic-ref --short HEAD)'
    abbr --add grv 'git remote -v'
    abbr --add gs 'git status -s'
    abbr --add gst 'git stash'
    abbr --add gsta 'git stash apply'
    abbr --add gsw 'git switch'
    abbr --add gswm 'git switch main'
    abbr --add gsw- 'git switch -'
    abbr --add gswc 'git switch -c'

    # eza
    abbr --add l 'eza -a -1 --git --icons'
    abbr --add ld 'eza -D -1 --git --icons'
    abbr --add la 'eza -a -l --git --icons'
    abbr --add ll 'eza -a -l --git --icons'

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

    # vercel
    abbr --add vep 'vercel env pull'

    # yabai and skhd
    abbr --add yb 'nvim ~/.config/yabai/yabairc'
    abbr --add ybs 'nvim ~/.config/skhd/skhdrc'

    # yadm dotfiles manager
    abbr --add y yadm
    abbr --add ya 'yadm add'
    abbr --add yc 'yadm commit'
    abbr --add ycm 'yadm commit -m'
    abbr --add yd 'yadm diff'
    abbr --add yp 'yadm push'
    abbr --add ys 'yadm status'
end
