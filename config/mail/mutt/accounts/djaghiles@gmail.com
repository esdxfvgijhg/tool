## Receive options.

set hostname         = "gmail.com"
set my_status_format    = " $my_shortcut1 $my_account1$my_status"
set status_format = $my_status_format
#unmailboxes *

# IMAP
set imap_user       = $my_account1
set imap_pass       = "AghilesD35JG"
set folder          = "imaps://imap.gmail.com:993"

# Offline IMAP
#set mbox_type       = Maildir
#set folder          = ~/Aghiles/Mail/$my_account1
#mailboxes           `find ~/Aghiles/Mail/$my_account1 -type d -name cur -printf '%h '|sed 's/ \//\n\//g'|sed 's/ /_/g'|sort|xargs echo`

# Divers
set from             =  $my_account1
set signature        =  $my_path/accounts/signatures/work

#SMTP
set smtp_url        = "smtps://$my_account1@smtp.gmail.com:465"
set smtp_pass       = "AghilesD35JG"

# Folder
set spoolfile        ="+[Gmail]/Tous les messages"
set mbox            ="+[Gmail]/Tous les messages"
set postponed       ="+[Gmail]/Brouillons"
set record          ="+[Gmail]/Messages envoyés"
set trash           ="+[Gmail]/Corbeille"


account-hook $folder 'set imap_user=$my_account1'
message-hook '~t ^$my_account1$' 'source $my_path/accounts/$my_account1' # Add some message hooks to automatically select the proper account when replying to an email
