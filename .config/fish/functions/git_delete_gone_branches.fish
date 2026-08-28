function git_delete_gone_branches -d 'Delete gone branches not checked out in a worktree'
    set -l tab (printf '\t')

    git branch --format='%(refname:short)%09%(upstream:track)%09%(worktreepath)' |
        while read -l line
            set -l parts (string split -m 2 $tab -- "$line")
            set -l branch $parts[1]
            set -l track $parts[2]
            set -l worktree $parts[3]

            test "$track" = "[gone]"; or continue
            test -z "$worktree"; or continue

            git branch -D -- "$branch"
        end
end
