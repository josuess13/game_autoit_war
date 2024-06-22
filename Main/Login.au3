#include <Includes.au3>
; Tela

Func criar_tela_login()
    Global $tela_login = GUICreate("", 300, 300)

    ; Login
    GUICtrlCreateLabel("Login", 120, 30, 60, 30)
    GUICtrlSetFont(-1, 14, 800)
    Local $input_login = GUICtrlCreateInput("", 50, 60, 200, 30, $ES_CENTER)
    GUICtrlSetFont(-1, 14, 800)

    ; Senha
    GUICtrlCreateLabel("Senha", 120, 110, 60, 30)
    GUICtrlSetFont(-1, 14, 800)
    Local $input_senha = GUICtrlCreateInput("", 50, 140, 200, 30, BitOr($ES_PASSWORD, $ES_CENTER))
    GUICtrlSetFont(-1, 14, 800)

    ; Botão de login
    Local $button_login = GUICtrlCreateButton("Entrar", 50, 200, 200, 40)
    GUICtrlSetFont(-1, 14, 800)

    GUISetState(@SW_SHOW, $tela_login)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd
EndFunc

criar_tela_login()
