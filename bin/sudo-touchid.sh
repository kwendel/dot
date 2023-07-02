#/bin/bash

echo 'sudo vim /etc/pam.d/sudo'
echo 'Add to start of file: auth       sufficient     pam_tid.so'
echo 'Disallow sessions in iTerm 2: Term2->Preferences > Advanced > (Goto the Session heading) > Allow sessions to survive logging out and back in.'
