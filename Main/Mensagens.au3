Func mensagem_aviso($mensagem, $bk_color, $btn_color, $lb_color)

    Local $tela_aviso = GUICreate("", 300, 150, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_aviso, "", 1)

    GUISetBkColor($bk_color)
    

    Local $texto = GUICtrlCreateLabel($mensagem, 10, 10, 280, 90, $SS_CENTER)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")
    GUICtrlSetColor(-1, $lb_color)

    Local $btn_ok = GUICtrlCreateButton("OK", 115, 100, 70, 40)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")
    GUICtrlSetBkColor(-1, $btn_color)
    

    GUISetState(@SW_SHOW, $tela_aviso)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_ok
                GUIDelete($tela_aviso)
                ExitLoop
        EndSwitch
    WEnd

EndFunc
