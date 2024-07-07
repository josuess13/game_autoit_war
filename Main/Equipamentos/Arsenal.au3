#include-once

Func tela_arsenal()

    Global $tela_arsenal = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_arsenal, "",0)
    GUISetBkColor(0x778899)

    local $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\arsenal.png", 0, 0, 800, 600)
    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)

    ;listar_equipamentos()

    ; Botões Armas
    Local $btn_equipar_arma = GUICtrlCreateButton("Equipar", 15, 480, 80, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    Local $btn_vender_arma = GUICtrlCreateButton("Vender", 100, 480, 80, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    Local $btn_ver_arma = GUICtrlCreateButton("Ver", 185, 480, 70, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")

    ; Botões Escudos
    Local $btn_equipar_escudo = GUICtrlCreateButton("Equipar", 280, 480, 80, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    Local $btn_vender_escudo = GUICtrlCreateButton("Vender", 365, 480, 80, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    Local $btn_ver_escudo = GUICtrlCreateButton("Ver", 450, 480, 70, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")

    ; Botões capacetes
    Local $btn_equipar_capacetes = GUICtrlCreateButton("Equipar", 545, 480, 80, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    Local $btn_vender_capacetes = GUICtrlCreateButton("Vender", 630, 480, 80, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    Local $btn_ver_capacetes = GUICtrlCreateButton("Ver", 715, 480, 70, 40)
    GUICtrlSetFont(-1, 8, "", 0, "Arial Black")
    
    mostrar_armas()
    mostrar_escudos()
    mostrar_capacetes()

    Local $btn_sair_equipamentos = GUICtrlCreateButton("Sair", 695, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    
    GUISetState(@SW_SHOW, $tela_arsenal)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_equipamentos
                GUIDelete($tela_arsenal)
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

Func mostrar_armas()
    GUICtrlCreateListView("Espada | Ataque | Guerreiro", 10, 20, 250, 450)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 120)
    _GUICtrlListView_SetColumnWidth(-1, 1, 60)
    _GUICtrlListView_SetColumnWidth(-1, 2, 70)


    GUICtrlCreateListViewItem("Escalibur | 2.0| Ananas raviezars",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)


EndFunc

Func mostrar_escudos()
    GUICtrlCreateListView("Escudo | Defesa | Guerreiro", 275, 20, 250, 450)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 120)
    _GUICtrlListView_SetColumnWidth(-1, 1, 60)
    _GUICtrlListView_SetColumnWidth(-1, 2, 70)


    GUICtrlCreateListViewItem("Madeira simples | 1.0| Ananas raviezars",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)

EndFunc

Func mostrar_capacetes()
    GUICtrlCreateListView("Capacete | Defesa | Guerreiro", 540, 20, 250, 450)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 120)
    _GUICtrlListView_SetColumnWidth(-1, 1, 60)
    _GUICtrlListView_SetColumnWidth(-1, 2, 70)


    GUICtrlCreateListViewItem("Gladiador | 1.0| Ananas raviezars",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)

EndFunc