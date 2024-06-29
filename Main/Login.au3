#include <Includes.au3>
; Tela

Func criar_tela_login()
    Global $tela_login = GUICreate("", 400, 400, -1, -1, $WS_POPUP)
    WinSetOnTop($tela_login, "", 1)

    local $plano_fundo_login = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\login.png", 0, 0, 400, 400)
    GUICtrlSetState($plano_fundo_login, $GUI_DISABLE)

    ; Login
    Local $acessar_login = GUICtrlCreateButton("Login", 60, 60, 80, 30, BitOR($BS_CENTER, $BS_FLAT))
    GUICtrlSetFont(-1, 14, 800)
    GUICtrlSetBkColor(-1, 0xB8860B)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")
    Local $input_login = GUICtrlCreateInput("", 140, 60, 200, 30, $ES_CENTER)
    GUICtrlSetFont(-1, 14, 800)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")
    GUICtrlSetBkColor(-1, 0xB0C4DE)


    ; Senha
    Local $acessar_senha = GUICtrlCreateButton("Senha", 60, 140, 80, 30, BitOR($BS_CENTER, $BS_FLAT))
    GUICtrlSetFont(-1, 14, 800)
    GUICtrlSetBkColor(-1, 0xB8860B)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")
    Local $input_senha = GUICtrlCreateInput("", 140, 140, 200, 30, BitOr($ES_PASSWORD, $ES_CENTER))
    GUICtrlSetFont(-1, 14, 800)
    GUICtrlSetBkColor(-1, 0xB0C4DE)


    ; Botão de login
    Local $button_login = GUICtrlCreateButton("Entrar", 60, 250, 150, 40)
    GUICtrlSetFont(-1, 14, 800)
    GUICtrlSetBkColor(-1, 0xB8860B)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")

    Local $button_cadastrar = GUICtrlCreateButton("Cadastrar", 220, 250, 120, 40)
    GUICtrlSetFont(-1, 14, 800)
    GUICtrlSetBkColor(-1, 0xB8860B)
    GUICtrlSetFont(-1, 14, 700, 0, "Artifakt Element Heavy")

    ControlFocus($tela_login, "text", $input_login)

    GUISetState(@SW_SHOW, $tela_login)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
            Case $acessar_login
                ControlFocus($tela_login, "text", $input_login)
            Case $acessar_senha
                ControlFocus($tela_login, "text",$input_senha)
    EndSwitch
    WEnd
EndFunc

criar_tela_login()
