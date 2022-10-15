#/bin/bash

read -p "Enter e-mail for key: " email
read -p "Enter key identifier/filename: " key
ssh-keygen -t ed25519 -C $email -f ~/.ssh/$key

eval "$(ssh-agent -s)"
if [ ! -f ~/.ssh/config ]; then
	echo "~/.ssh/config not existing... Creating one"
	touch ~/.ssh/config
	echo "\nHost *\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/$key\n" >> ~/.ssh/config
fi
ssh-add ~/.ssh/$key
pbcopy < ~/.ssh/$key.pub
echo "Public key copied to clipboard!"
