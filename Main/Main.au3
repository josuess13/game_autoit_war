##include-once
#include <Includes.au3>

Func tela_principal()

    Global $tela_principal = GUICreate("", 800, 600, -1, -1, $WS_POPUP)

    $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\iniciar_1.png", 0, 0, 800, 600)
    ;$heroi_usado = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\guerreiro_1.png", 303, 382, 208, 205)
    WinSetOnTop($tela_principal, "",0)

    Local $nome_do_jogo = GUICtrlCreateLabel("LORDS OF WAR", 150, 20, 500, 60, $SS_CENTER)
    GUICtrlSetFont(-1, 40, 700, "", "Copperplate Gothic Bold")

    $btn_herois = GUICtrlCreateButton("Heróis", 620, 375, 160, 35, $BS_DEFPUSHBUTTON)
    GUICtrlSetFont(-1, 12, 700, "", "Copperplate Gothic Bold")
	GUICtrlSetBkColor(-1, 0x8B0000)
    GUICtrlSetColor(-1, 0xF0F8FF)

    $btn_arena = GUICtrlCreateButton("Arena", 620, 420, 160, 35)
    GUICtrlSetFont(-1, 12, 700, "", "Copperplate Gothic Bold")
	GUICtrlSetBkColor(-1, 0x8B0000)
    GUICtrlSetColor(-1, 0xF0F8FF)

    $btn_equipamentos = GUICtrlCreateButton("Equipamentos", 620, 465, 160, 35)
    GUICtrlSetFont(-1, 12, 700, "", "Copperplate Gothic Bold")
	GUICtrlSetBkColor(-1, 0x8B0000)
    GUICtrlSetColor(-1, 0xF0F8FF)

    $btn_treino = GUICtrlCreateButton("Treino", 620, 510, 160, 35)
    GUICtrlSetFont(-1, 12, 700, "", "Copperplate Gothic Bold")
	GUICtrlSetBkColor(-1, 0x8B0000)
    GUICtrlSetColor(-1, 0xF0F8FF)

    $btn_sair = GUICtrlCreateButton("Sair", 620, 555, 160, 35)
    GUICtrlSetFont(-1, 12, 700, "", "Copperplate Gothic Bold")
	GUICtrlSetBkColor(-1, 0x8B0000)

    $btn_img_heroi = GUICtrlCreateButton("", 303, 382, 208, 205, $BS_BITMAP)
    $btn_img_heroi = GUICtrlSetImage(-1, @ScriptDir & "\..\Imagens\guerreiro_1.bmp")

    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)
    ;GUICtrlSetState($heroi_usado, $GUI_DISABLE)

    GUISetState(@SW_SHOW, $tela_principal)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair
                ExitLoop
        EndSwitch
    WEnd

EndFunc

tela_principal()