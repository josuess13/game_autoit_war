#include-once

Func tela_capacetes()

    Global $tela_capacetes = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_capacetes, "",0)
    GUISetBkColor(0x778899)

    ;local $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\arsenal.png", 0, 0, 800, 600)
    ; Move as imagens para o fundo
    ;GUICtrlSetState($plano_fundo, $GUI_DISABLE)

    mostrar_capacetes()

    ; Botões Armas
    Local $btn_equipar_arma = GUICtrlCreateButton("Comprar", 20, 540, 400, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")

    Local $btn_sair_equipamentos = GUICtrlCreateButton("Sair", 430, 540, 350, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    
    GUISetState(@SW_SHOW, $tela_capacetes)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_equipamentos
                GUIDelete($tela_capacetes)
                tela_principal()
                ExitLoop
            ;~ Case identifica_guerreiro_selecionado() <> "Sem_imagem"
            ;~     If $guerreiro_selecionado <> identifica_guerreiro_selecionado() Then
            ;~         mostrar_imagem_guerreiro(identifica_guerreiro_selecionado())
            ;~         $guerreiro_selecionado = identifica_guerreiro_selecionado()
            ;~         ;~ If $guerreiro_selecionado <> 1 And $guerreiro_selecionado <> "Sem_imagem" Then 
            ;~         ;~     mostrar_card_guerreiro($guerreiro_selecionado)
            ;~         ;~ EndIf
            ;~     EndIf
        EndSwitch
    WEnd

EndFunc

Func mostrar_capacetes()
    GUICtrlCreateListView("Escudo | Ataque | Nível | Preço", 20, 20, 400, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 180)
    _GUICtrlListView_SetColumnWidth(-1, 1, 70)
    _GUICtrlListView_SetColumnWidth(-1, 2, 50)
    _GUICtrlListView_SetColumnWidth(-1, 3, 95)

    GUICtrlCreateListViewItem("Escalibur | 2.0 | 3 | 500",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)

    local $plano_fundo = GUICtrlCreatePic("D:\projetos\game_autoit_war\Imagens\Equipamentos\Capacetes\Capacete_nivel_1.bmp", 430, 70, 350, 400)
    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)
EndFunc