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

