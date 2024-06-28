#include-once
#include <Includes.au3>

Func tela_principal()

    Global $tela_principal = GUICreate("", 800, 600, -1, -1, $WS_POPUP)

    $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\Main_pf.png", 0, 0, 800, 600)
    WinSetOnTop($tela_principal, "",0)

    criar_menus()

    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)

    GUISetState(@SW_SHOW, $tela_principal)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $submenu_sair_sair
                ExitLoop
        EndSwitch
    WEnd

EndFunc

tela_principal()