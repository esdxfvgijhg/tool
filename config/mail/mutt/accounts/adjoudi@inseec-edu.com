## Receive options.

set hostname         = "inseec-edu.com"
set my_status_format    = " $my_shortcut2 $my_account2$my_status"
set status_format = $my_status_format
#unmailboxes *

# IMAP
set imap_user       = $my_account2
set imap_pass       = "2SHPTdYET"
set folder          = "imaps://outlook.office365.com"
#set folder          = "imaps://outlook.office365.com:993"

# Offline IMAP
#set mbox_type       = Maildir
#set folder          = ~/Aghiles/Mail/$my_account2
#mailboxes           `find ~/Aghiles/Mail/$my_account2 -type d -name cur -printf '%h '|sed 's/ \//\n\//g'|sed 's/ /_/g'|sort|xargs echo`

# Divers
set from             =  $my_account2
set signature        =  $my_path/accounts/signatures/work

#SMTP
set smtp_url        = "smtp://$my_account2@outlook.office365.com:587/"
set smtp_pass       = "2SHPTdYET"

# Folder
set spoolfile        ="+INBOX""
set mbox             ="+All Items"
set postponed        ="+Drafts"
set record           ="+Sent Items"
set trash            ="+Deleted Items"
mailboxes


account-hook $folder 'set imap_user=$my_account2'
message-hook '~t ^$my_account2$' 'source $my_path/accounts/$my_account2' # Add some message hooks to automatically select the proper account when replying to an email
