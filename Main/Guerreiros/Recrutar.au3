#include-once

Func tela_recrutar_guerreiros()

    Global $tela_recrutar_guerreiros = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))

    WinSetOnTop($tela_recrutar_guerreiros, "",0)

    local $imagem_guerreiro = GUICtrlCreatePic("D:\projetos\game_autoit_war\Imagens\herois\Hercules_simples.bmp", 485, 20, 300, 400)
    If @error Then MsgBox(0, "", "Erro")
    GUICtrlSetState($imagem_guerreiro, $GUI_DISABLE)

    Local $listar_guerreiros_recrutas = GUICtrlCreateListView("Guerreiro | Ataque | Defesa | Inteligência | Força | Agilidade", 20, 20, 455, 400)
    GUICtrlCreateListViewItem("Thor Odinson | 10 | 9 | 1 | 2 | 1", $listar_guerreiros_recrutas)

    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 0, 120)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 1, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 2, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 3, 80)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 4, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 5, 70)

    _GUICtrlListView_SetExtendedListViewStyle($listar_guerreiros_recrutas, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FLATSB, $LVS_EX_HEADERDRAGDROP ))
	_GUICtrlListView_SetTextBkColor($listar_guerreiros_recrutas, 0xE0E0E0)
	_GUICtrlListView_SetBkColor($listar_guerreiros_recrutas, 0xFFFFFF)
	_GUICtrlListView_SetTextColor($listar_guerreiros_recrutas, 0x000000)

    GUISetState(@SW_SHOW, $tela_recrutar_guerreiros)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                GUIDelete($tela_recrutar_guerreiros)
                tela_principal()
                ExitLoop
        EndSwitch
    WEnd

EndFunc