## Receive options.

set hostname         = "gmail.com"
set my_status_format    = " $my_shortcut0 $my_account0$my_status"
set status_format = $my_status_format
#unmailboxes *

# IMAP
set imap_user       = $my_account0
set imap_pass       = `pass aghilesdjoudi@gmail.com`
set folder          = "imaps://imap.gmail.com:993"

# Offline IMAP
#set mbox_type       = Maildir
#set folder          = ~/Aghiles/Mail/$my_account0
#mailboxes           `find ~/Aghiles/Mail/$my_account0 -type d -name cur -printf '%h '|sed 's/ \//\n\//g'|sed 's/ /_/g'|sort|xargs echo`

# Divers
set from             =  $my_account0
set signature        =  $my_path/accounts/signatures/work

#SMTP
set smtp_url        = "smtps://$my_account0@smtp.gmail.com:465"
set smtp_pass       = `pass aghilesdjoudi@gmail.com`

# Folder
set spoolfile        ="+[Gmail]/Tous les messages"
set mbox            ="+[Gmail]/Tous les messages"
set postponed       ="+[Gmail]/Brouillons"
set record          ="+[Gmail]/Messages envoyés"
set trash           ="+[Gmail]/Corbeille"

#named-mailboxes "   Reçus" ="+[Gmail]/Tous les messages"
#named-mailboxes "   Envoyés" ="[Gmail].Sent Mail"
#named-mailboxes "   Brouillons" =[Gmail].Drafts
#named-mailboxes "   Junk" =[Gmail].Spam
#named-mailboxes "   Poubelle" =[Gmail].Trash
#named-mailboxes " ---------   GMAIL ----------" ="."
#named-mailboxes "   FELINN" =FELINN
#named-mailboxes "   Logement" =Logement
#named-mailboxes "   Paperasse" =Paperasse
#named-mailboxes "   Personnel" =Personnel
#named-mailboxes "   Dev Varreau" =Site
#named-mailboxes "   Nuits d'Été" ="Nuits d'été"
#named-mailboxes "   Copains" =Blablabla

account-hook $folder 'set imap_user=$my_account0'
message-hook '~t ^$my_account0$' 'source $my_path/accounts/$my_account0' # Add some message hooks to automatically select the proper account when replying to an email

#folder-hook $my_account0 'source $my_path/accounts/$my_account0'
#folder-hook $my_account0 'source $my_path/accounts/$my_account1'
#folder-hook $my_account0 'source $my_path/accounts/$my_account2'
#folder-hook $my_account0 'source $my_path/accounts/$my_account3'
#folder-hook $my_account0 'source $my_path/accounts/$my_account4'

#mailboxes `find ~/Aghiles/Mail/$my_account0 -type d -name cur -printf '%h '|tr " " "\n"|grep -v "^/home/iranzo/.maildir/FOLDER$"|sort|xargs echo`
#mailboxes ! +mutt-dev +mutt-users +open-pgp +wmaker +hurricane +vim +ietf  +drums
#virtual-mailboxes "notmuch" "notmuch://?query=folder:notmuch and NOT tag:archive"
#virtual-mailboxes "vfio" "notmuch://?query=folder:vfio and NOT tag:archive"

#mailboxes            `echo $HOME/Mail/*` # mailboxes +GMail/INBOX +GMail/Principale
