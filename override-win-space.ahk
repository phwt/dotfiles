FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\override-win-space.lnk

; Make Win + Space behave like in macOS (swap layout instead of of cycling through)
#Space::
    Sleep 100
    SendInput, {Alt Down}{Shift Down}{Shift Up}{Alt Up}
Return