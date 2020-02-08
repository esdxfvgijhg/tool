## Receive options.

set hostname         = "gmail.com"
set my_status_format    = " $my_shortcut1 $my_account1$my_status"
set status_format = $my_status_format
#unmailboxes *

# IMAP
set imap_user       = $my_account1
set imap_pass       = `pass djaghiles@gmail.com`
set folder          = "imaps://imap.gmail.com:993/[Gmail]/"

# Offline IMAP
#set mbox_type       = Maildir
#set folder          = ~/Aghiles/Mail/$my_account1
#mailboxes           `find ~/Aghiles/Mail/$my_account1 -type d -name cur -printf '%h '|sed 's/ \//\n\//g'|sed 's/ /_/g'|sort|xargs echo`

# Divers
set from             =  $my_account1
set signature        =  $my_path/accounts/signatures/work
my_hdr Bcc: $my_account1

#SMTP
set smtp_url        = "smtps://$my_account1@smtp.gmail.com:465/"
set smtp_pass       = `pass djaghiles@gmail.com`

# Folder
set spoolfile        ="+Tous les messages"
set mbox            ="+Tous les messages"
set postponed       ="+Brouillons"
set record          ="+Messages envoyés"
set trash           ="+Corbeille"
mailboxes


