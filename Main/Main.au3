#include-once

Func tela_principal()

    Global $tela_principal = GUICreate("", 800, 600, -1, -1, $WS_POPUP)

    local $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\Main_pf.png", 0, 0, 800, 600)
    WinSetOnTop($tela_principal, "",0)

    criar_menus()

    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)

    GUISetState(@SW_SHOW, $tela_principal)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $submenu_sair_sair
                ExitLoop
            Case $submenu_guerreiros_recrutar
                GUIDelete($tela_principal)
                tela_recrutar_guerreiros()
                ExitLoop
        EndSwitch
    WEnd

EndFunc

;tela_principal()