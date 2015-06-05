#IfWinActive ahk_class CabinetWClass
    ^m:: ; Ctrl+M
 
        ; Get full path from open Explorer window
        WinGetText, FullPath, A
     
        ; Split up result (it returns paths seperated by newlines)
        StringSplit, PathArray, FullPath, `n
     
        ; Get first item
        FullPath = %PathArray1%
     
        ; Clean up result
        FullPath := RegExReplace(FullPath, "(^Address: )", "")
        StringReplace, FullPath, FullPath, `r, , all
     
        ; Change working directory
        SetWorkingDir, %FullPath%
     
        ; An error occurred with the SetWorkingDir directive
        If ErrorLevel
            Return
     
        ; Display input box for filename
        InputBox, UserInput, New File (example: foo.txt), , , 400, 100
     
        ; User pressed cancel
        If ErrorLevel
            Return
     
        ; Create file
        FileAppend, , %UserInput%
     
        ; Open the file in the appropriate editor
        Run %UserInput%
 
    Return

#IfWinActive