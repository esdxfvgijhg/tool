c.aliases['usr'] = 'spawn --userscript'
c.aliases['pass'] = 'spawn --userscript qute-pass'
c.aliases['zotero'] = 'spawn --userscript zotero'
c.aliases['Zotero'] = 'hint links userscript zotero'
c.aliases['password_fill'] = 'spawn --userscript password_fill'


config.bind('<Ctrl-c>', 'spawn copyx {url}', mode='normal')

config.bind('<Ctrl-z>', 'zotero', mode='normal')
config.bind('<Ctrl-Shift-z>', 'Zotero', mode='normal')

config.bind('<Ctrl-m>', 'password_fill', mode='normal')
config.bind('<Ctrl-Shift-p>', 'pass', mode='normal')

config.bind('<Ctrl-i>', 'set content.user_stylesheets \'["themes/solarized-dark.css", "themes/custom_solarized.css"]\'', mode='normal')
config.bind('<Ctrl-Shift-i>', 'set content.user_stylesheets \'[]\'', mode='normal')

c.content.user_stylesheets = ['themes/solarized-dark.css','themes/custom_solarized.css']

c.content.cookies.store = False
c.content.cookies.accept = 'all'
