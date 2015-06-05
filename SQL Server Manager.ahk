SetTitleMatchMode, 2
#IfWinActive Microsoft SQL Server Management Studio

	; select current line and run
    ^Enter::
        sendinput {home}
        sendinput +{end}
        sendinput {f5}
    return

    ; type "SELECT * FROM " 
    !s::
        SendInput SELECT * FROM{space}
    return

    ; select all from current item
    !x::
        SendInput ^c
        SendInput SELECT * FROM{space}
        SendInput %clipboard%
    return

#IfWinActive