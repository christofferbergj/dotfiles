function ollama_commit_msg -d 'Generate commit msg with Mistral'
    # check if there are changes to commit
    set git_diff (git diff --staged)

    if not test -n "$git_diff"
        echo "No changes to commit."
        return
    end

    # check if ollama is installed
    if not command -v ollama > /dev/null ^&1
        echo "Ollama is not installed. Please install it before running this script. https://ollama.com/"
        return
    end

    # generate the commit message
    set -l commit_message (string trim -- (ollama run mistral \
        "Generate a git commit message in present tense that follows these specifications:
            1: Must be a maximum of 80 characters.
            2: One line of text with no lists of changes.
            3: Exclude anything unnecessary such as translations and longer descriptions of the changes.
            4. Use imperative verb form e.g. 'update' instead of 'updated' and 'add' instead of 'added'.
            5. Keep it short, concise, and to the point.

            Your entire response will be passed directly into git commit

            Examples of good commit messages:
            - 'Update the README with new information'
            - 'Add new address picker to checkout'
            - 'Add new billing queries to b2c'
            - 'Import and implement billingQueries in the billing route'

            Code diff: $git_diff"))

    echo (set_color green)"Commit message: "(set_color normal)"$commit_message"

    # confirm the commit message
    read -P "Is the commit message correct? (Y/n): " confirm

   # if the user doesn't confirm, abort the commit
    if test -z "$confirm"
        echo "Commit aborted."
        return
    end

    switch "$confirm"
        case 'y' ''
            git commit -m "$commit_message"
        case '*'
            echo "Commit aborted."
    end
end
