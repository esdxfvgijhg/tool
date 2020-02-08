### Controlling Awesome

Description |Command| Shortcut
--- | --- | ---
Restart Awesome | awesome.restart | ``Mod4`` + ``Control`` + ``r``
Quit from Awesome | awesome.quit | ``Mod4`` + ``Shift`` + ``q``

### Tag browsing

Description | Shortcut
--- | ---
Go left | ``Mod4`` + ``left``
Go right | ``Mod4`` + ``right``
Go to the last  | ``Mod4`` + ``Esc``
Go to next Non empty left tag | ``alt`` + ``left``
Go to next Non empty right tag | ``alt`` + ``right``
Go to Tag number | ``Mod4`` + ``1...9``
Toggle tag | ``Mod4`` + ``Control`` + ``1...9``
Move client to tag | ``Mod4`` + ``Shift`` + ``1...9``
Toggle tag | ``Mod4`` + ``Control`` + ``Shift`` + ``1...9``

### Dynamic Tag actions

Description | Shortcut
--- | ---
Add new tag | ``modkey`` + ``Shift`` + ``n``
Rename tag | ``modkey`` + ``Shift`` + ``r``
Move to next tag | ``modkey`` + ``Shift`` + ``Right``
Move to previous tag | ``modkey`` + ``Shift`` + ``Left``
Delete tag | ``modkey`` + ``Shift`` + ``d``


### Client focus

Description | Shortcut
---  | ---
Focus | ``Alt`` + ``k``
Set focus to next application | ``Alt`` + ``j``
Set focus by direction down | ``Mod4`` + ``j``
Set focus by direction up | ``Mod4`` + ``k``
Set focus by direction left | ``Mod4`` + ``h``
**!FIX IT!** Set focus by direction right | ``Mod4`` + ``l``
Panic mode, allways switch to screen 1, tag 2 named 'IDE' ;)  | ``Alt`` + ``a``
Set focus to relative next relative screen | ``Mod4`` + ``Control`` + ``j``
Set focus to relative next relative screen | ``Mod4`` + ``Control`` + ``k``
Jump to the client that received the urgent hint first. | ``Mod4`` + ``u``

### Layout manipulation
Description | Shortcut
---  | ---
Client swap to next layout | ``Mod4`` + ``Shift`` + ``j``
Client swap to previous layout | ``Mod4`` + ``Shift`` + ``k``
Switch client (a.k.a. Alt`` + ``Tab on Windows | ``Mod4`` + ``Tab``
Increase master width of the client | ``Alt`` + ``Shift`` + ``l``
Decrease master width of the client | ``Alt`` + ``Shift`` + ``h``
Increase the number of master windows | ``Mod4`` + ``Shift`` + ``l``
Decrease the number of master windows | ``Mod4`` + ``Shift`` + ``h``
Increase number of column windows. | ``Mod4`` + ``Control`` + ``l``
Decrease number of column windows. | ``Mod4`` + ``Control`` + ``h``
Change the layout of the current tag. |  ``Mod4`` + ``Space``
Change back to the previous layout of the current tag. |  ``Mod4`` + ``Shift`` + ``Space``
Minimize  a client | ``Mod4`` + ``n``
Restore (=unminimize) a client. | ``Mod4`` + ``Control`` + ``n``
Toggle full screen | ``Mod4`` + ``f``
Quit from application | ``Mod4`` + ``q``
Toggle the floating state of a client | ``Mod4`` + ``Control`` + ``Space``
Get the master window | ``Mod4`` + ``Control`` + ``Return``
Move a client to a screen | ``Mod4`` + ``o``
Move a client to the top of every other windows | ``Mod4`` + ``t``

### User applications

Description |Command| Shortcut
--- | --- | --- 
Open terminal | ``urxvtc`` or ``xterm`` | ``Mod4`` + ``Return``
Drop down terminal | ``urxvtc`` or ``xterm``  | ``Mod4`` + ``z``
Show calendar | | ``Alt`` + ``c``
Show music player | ncmpcpp |  ``Alt`` + ``x`` |
Take a screenshot | gnome-screenshot --interactive | ``Alt`` + `` p`` 
Lock screen & mute volume & turn off the screen | amixer -D pulse set Master 1+ toggle && xset dpms force off && i3lock -e -f -c 000000 | ``Mod4`` + ``l``
Open browser | firefox | ``Mod4`` + ``w``
Open developer browser | firefox-aurora | ``Mod4`` + ``Shift`` + ``w``
Open browser in private mode | firefox --private-window | ``Mod4`` + ``Control`` + ``w``
Open secondary browser | chromium | ``Mod4`` + ``i``
Open secondary browser in incognito mode | chromium --incognito | ``Mod4`` + ``Control`` + ``i``
Open text editor | subl | ``Mod4`` + ``s``
Open image editor | gimp | ``Mod4`` + ``g``
Open file manager | nautilus | ``Mod4`` + ``e``
Run custom command | | ``Mod4`` + ``r``
Run Lua command | | ``Mod4`` + ``x``

### ALSA volume control
Description | Shortcut
--- | --- 
Raise Volume | ``Mod4`` + ``Up`` or ``XF86AudioRaiseVolume``
Lower Volume | ``Mod4`` + ``Down`` or ``XF86AudioLowerVolume``
Toggle mute  | ``Mod4`` + ``m`` or ``XF86AudioMute``
Set volume to 100% |  ``Mod4`` + ``XF86AudioRaiseVolume``

### MPD control
Description | Shortcut
--- | --- 
Pause | ``Alt`` + ``Control`` + ``Up`` or ``XF86AudioPlay``
Stop | ``Alt`` + ``Control`` + ``Down``
Previous |  ``Alt`` + ``Control`` + ``Left`` or ``XF86AudioPrev``
Next |  ``Alt`` + ``Control`` + ``Right`` or ``XF86AudioNext``

### Misc
Description | command | Shortcut
---  | --- | ---
Show menu | | ``Mod4`` + ``a``
Show/Hide Wibox | | ``Mod4`` + ``b``
Show menubar | | ``Mod4`` + ``p``
Copy to clipboard | xsel -p -o \| xsel -i -b | ``Mod4`` + ``c``
Change between keyboard layouts | setxkbmap | ``Alt`` + ``Shift_L``
Toggle Redshift | redshift | ``Mod4`` + ``Shift`` + ``T``

### Misc
Description | command | Shortcut
---  | --- | ---
Increase brightness with 10% | light -A 10 | ``XF86MonBrightnessUp``
Decrease brightness with 10% | light -U 10 | ``XF86MonBrightnessDown``
Increase brightness with 10% | light -A 10 | ``Mod4`` + ``Alt`` + ``Up``
Decrease brightness with 10% | light -U 10 | ``Mod4`` + ``Alt`` + ``Down``