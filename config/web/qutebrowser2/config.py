c.aliases['pass'] = 'spawn --userscript qute-pass'
c.aliases['zotero'] = 'spawn --userscript zotero'
c.aliases['Zotero'] = 'hint links userscript zotero'

config.bind('<Ctrl-z>', 'zotero', mode='normal')
config.bind('<Ctrl-Shift-z>', 'Zotero', mode='normal')
config.bind('<Ctrl-Shift-p>', 'pass', mode='normal')

