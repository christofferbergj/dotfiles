function read_confirm
    while true
        read -l -P 'Is the commit message correct? [Y/n] ' confirm

        switch $confirm
            case '' y Y
                return 0
            case n N
                return 1
        end
    end
end

function ollama_commit_msg -d 'Generate commit msg with Mistral'
    # check if there are changes to commit
    set git_diff (git diff --staged)

    if not test -n "$git_diff"
        echo "No changes to commit."
        return
    end

    # check if ollama is installed
    if not command -v ollama >/dev/null ^&1
        echo "Ollama is not installed. Please install it before running this script. https://ollama.com/"
        return
    end

    # generate the commit message
    set -l commit_message (string trim -- (ollama run llama3 \
        "Generate a git commit message in present tense that follows these specifications:
            1. Start with a capital letter.
            2. Use a maximum of 80 characters.
            3. Write in one line with no lists or lengthy descriptions.
            4. Avoid unnecessary details like translations.
            5. Express actions with imperative verbs (e.g., 'update' rather than 'updated').
            6. Be short, concise, and to-the-point.
            7. Provide a singular commit message, not options.
            8. Do not end with a period.
            9. Emphasize the purpose of the commit over the process.
            10.	Refrain from repeating commit messages for identical changes.
            11.	Use active voice in present-tense.
            12.	Be specific, detailing the area of code changed and the reason why.

            Your entire response will be passed directly into git commit

            Examples of good commit messages:
            - 'Update the README with new information'
            - 'Add new address picker to checkout'
            - 'Add new billing queries to b2c'
            - 'Import and implement billingQueries in the billing route'

            Code diff: $git_diff"))

    echo (set_color green)"Commit message: "(set_color normal)"$commit_message"

    # confirm the commit message
    if read -l -P "Is the commit message correct? (Y/n): " confirm
        switch "$confirm"
            case y ''
                # Proceed with the commit if the user presses 'Enter' or 'y'
                git commit -m "$commit_message"
            case '*'
                # Abort on any other input
                echo "Commit aborted."
        end
    else
        # Abort if read gets a ctrl-c
        echo "Commit aborted."
    end
end
