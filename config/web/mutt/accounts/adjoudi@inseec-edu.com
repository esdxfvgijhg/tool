## Receive options.

set hostname         = "inseec-edu.com"
set my_status_format    = " $my_shortcut2 $my_account2$my_status"
set status_format = $my_status_format
#unmailboxes *

# IMAP
set imap_user       = $my_account2
set imap_pass       = `pass adjoudi@inseec-edu.com`
set folder          = "imaps://outlook.office365.com" # "imaps://outlook.office365.com:993"

# Offline IMAP
#set mbox_type       = Maildir
#set folder          = ~/Aghiles/Mail/$my_account2
#mailboxes           `find ~/Aghiles/Mail/$my_account2 -type d -name cur -printf '%h '|sed 's/ \//\n\//g'|sed 's/ /_/g'|sort|xargs echo`

# Divers
set from             =  $my_account2
set signature        =  $my_path/accounts/signatures/work
my_hdr Bcc: $my_account2

#SMTP
set smtp_url        = "smtp://$my_account2@outlook.office365.com:587/"
set smtp_pass       = `pass adjoudi@inseec-edu.com`

# Folder
set spoolfile        ="+INBOX""
set mbox             ="+All Items"
set postponed        ="+Drafts"
set record           ="+Sent Items"
set trash            ="+Deleted Items"
mailboxes


