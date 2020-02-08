## Receive options.

set hostname         = "gmail.com"
set my_status_format    = " $my_shortcut0 $my_account0$my_status"
set status_format = $my_status_format
#unmailboxes *

# IMAP
set imap_user       = $my_account0
set imap_pass       = `pass aghilesdjoudi@gmail.com`
set folder          = "imaps://imap.gmail.com:993/[Gmail]/"

# Offline IMAP
#set mbox_type       = Maildir
#set folder          = ~/Aghiles/Mail/$my_account0
#mailboxes           `find ~/Aghiles/Mail/$my_account0 -type d -name cur -printf '%h '|sed 's/ \//\n\//g'|sed 's/ /_/g'|sort|xargs echo`

# Divers
set from             =  $my_account0
set signature        =  $my_path/accounts/signatures/work
my_hdr Bcc: $my_account0

#SMTP
set smtp_url        = "smtps://$my_account0@smtp.gmail.com:465/"
set smtp_pass       = `pass aghilesdjoudi@gmail.com`

# Folder
set spoolfile        ="+Tous les messages"
set mbox            ="+Tous les messages"
set postponed       ="+Brouillons"
set record          ="+Messages envoyés"
set trash           ="+Corbeille"
mailboxes


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


