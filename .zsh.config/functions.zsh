function lpe(){
`
# Set LPE aws profile using: lpe <lpe-profile>
`
    export AWS_PROFILE=$1
    return 0
}

function mfa(){
`
# Set aws profile using aws-mfa with: mfa <profile>
`

    # request temporary credentials with global python version
    $PYENV_ROOT/versions/3.9.11/bin/aws-mfa --duration 129600 --profile $1
   
    # set aws environment if aws-mfa was successfull (exit 0)
    if [[ $? = 0 ]]; then
        export AWS_PROFILE=$1
        return 0
    fi
    return 1
}

function mkd() {
`
# Create a new directory and enter it
`
	mkdir -p "$@" && cd "$_";
}


function fs() {
`
# Determine size of a file or total size of a directory
`
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

export HOMEBREW_NO_AUTO_UPDATE=1
function brew() {
`
# Extend brew command:
# - brew sync: update, upgrade and save brew bundle
`
# - TODO: link brew to global python
    if [[ $1 == 'sync' ]]; then
        brew update
        brew upgrade
        brew bundle --file=~/.brewfile --force dump
        dotg add ~/.brewfile
        if [[ `dotg status --porcelain` ]]; then
            # Changes
            dotg commit -m "$(date +%Y.%m.%d): update brewfile"
            dotg push
        fi
    else
        command brew "$@";
    fi
}

function git() {
`
# Extend git command:
#- git checkout: fuzzy search in "git checkout" output
`
    # Only capture empty "git checkout" command
    if [[ "$1" == 'checkout' && -z "$2" ]]; then
        # Fuzzy search the branches with fzf
        BRANCH=$(git branch -a -vv --color=always | 
            grep -v '/HEAD\s' | 
            fzf --height 30% --ansi --multi --tac | 
            sed 's/^..//' | 
            awk '{print $1}' |
            sed 's#^remotes/[^/]*/##'
        )
        # Execute command and put it in the zsh history
        command git checkout "$BRANCH";
        print -s "git checkout ${BRANCH}"
    else
        command git "$@";
    fi
}

function envrc() {
`
# Append common settings to .envrc and allow them.
# - envrc poetry: layout poetry in .envrc
# - envrc node <version>: use nvm <version> in .envrc
`
    if [[ "$1" == 'poetry' ]]; then
        echo "layout poetry" >> .envrc; 
    elif [[ "$1" == 'node' ]]; then
        echo "use nvm ${2}" >> .envrc;
    fi

    direnv allow .;
}

