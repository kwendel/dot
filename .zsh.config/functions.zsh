# Set LPE aws profile using: lpe <lpe-profile>
function lpe(){
    export AWS_PROFILE=$1
    return 0
}

# Set aws profile using aws-mfa with: mfa <profile>
function mfa(){

    # request temporary credentials with global python version
    $PYENV_ROOT/versions/3.9.11/bin/aws-mfa --duration 129600 --profile $1
   
    # set aws environment if aws-mfa was successfull (exit 0)
    if [[ $? = 0 ]]; then
        export AWS_PROFILE=$1
        return 0
    fi
    return 1
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Determine size of a file or total size of a directory
function fs() {
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

# Extend brew:
# - brew sync: update, upgrade and save brew bundle
# - TODO: link brew to global python
export HOMEBREW_NO_AUTO_UPDATE=1
function brew() {
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

