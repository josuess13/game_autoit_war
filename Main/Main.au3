#include-once

Func tela_principal()

    Global $tela_principal = GUICreate("", 800, 600, -1, -1, $WS_POPUP)
    WinSetOnTop($tela_principal, "",0)

    local $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\Main_pf.png", 0, 0, 800, 600)
    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)

    criar_menus()

    GUISetState(@SW_SHOW, $tela_principal)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $submenu_sair_sair
                ExitLoop
            Case $submenu_guerreiros_recrutar
                GUIDelete($tela_principal)
                tela_recrutar_guerreiros()
                ExitLoop
            Case $submenu_guerreiros_seus_guerreiros
                GUIDelete($tela_principal)
                tela_guerreiros()
                ExitLoop
            Case $submenu_equipamentos_arsenal
                GUIDelete($tela_principal)
                tela_arsenal()
                ExitLoop
            Case $submenu_equipamentos_armas
                GUIDelete($tela_principal)
                tela_armas()
                ExitLoop
            case $submenu_equipamentos_escudos
                GUIDelete($tela_principal)
                tela_escudos()
                ExitLoop
            Case $submenu_equipamentos_capacetes
                GUIDelete($tela_principal)
                tela_capacetes()
                ExitLoop
        EndSwitch
    WEnd

EndFunc

;tela_principal()