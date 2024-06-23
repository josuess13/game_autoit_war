#include-once
#include <Includes.au3>

Func tela_herois()

    Global $tela_herois = GUICreate("", 800, 600, -1, -1, $WS_POPUP)

    $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\herois_pf2.png", 0, 0, 800, 600)
    WinSetOnTop($tela_herois, "",0)
    Local $nome_do_heroi = GUICtrlCreateLabel("Heróis", 300, 20, 220, 60, $SS_CENTER)
    GUICtrlSetFont(-1, 40, 700, "", "Copperplate Gothic Bold")

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

    $btn_voltar = GUICtrlCreateButton("Voltar", 620, 555, 160, 35)
    GUICtrlSetFont(-1, 12, 700, "", "Copperplate Gothic Bold")
	GUICtrlSetBkColor(-1, 0x8B0000)

    local $guerreiro = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\herois\heroi.png", 282, 318, 260, 240)

    Local $btn_up = GUICtrlCreateButton("", 400, 277, 40, 40, $BS_ICON)
    GUICtrlSetImage(-1, @ScriptDir & "\..\Imagens\icons\seta_up.ico")

    Local $btn_down = GUICtrlCreateButton("", 400, 558, 40, 40, $BS_ICON)
    GUICtrlSetImage(-1, @ScriptDir & "\..\Imagens\icons\seta_dw.ico")

    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)
    GUICtrlSetState($guerreiro, $GUI_DISABLE)

    GUISetState(@SW_SHOW, $tela_herois)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
            Case $btn_voltar
                GUIDelete($tela_herois)
                tela_principal()
                ExitLoop
            Case $btn_up
                $guerreiro = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\herois\guerreira_1.png", 282, 318, 260, 240)  
                GUICtrlSetState($guerreiro, $GUI_DISABLE)
                GUICtrlCreateButton("Salvar", 315, 200, 200, 60)
                GUICtrlSetFont(-1, 20, 700, "", "Copperplate Gothic Bold")
                GUICtrlSetBkColor(-1, 0xD2691E)
            Case $btn_down
                $guerreiro = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\herois\guerreiro_1.png", 282, 318, 260, 240)  
                GUICtrlSetState($guerreiro, $GUI_DISABLE)
                GUICtrlCreateButton("Salvar", 315, 200, 200, 60)
                GUICtrlSetFont(-1, 20, 700, "", "Copperplate Gothic Bold")
                GUICtrlSetBkColor(-1, 0xD2691E)
        EndSwitch
    WEnd

EndFunc