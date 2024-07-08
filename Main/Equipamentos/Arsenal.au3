#include-once

Func tela_arsenal()

    Global $tela_arsenal = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_arsenal, "",0)
    GUISetBkColor(0x778899)

    GUICtrlCreateTab(0, 0, 800, 20)

    GUICtrlCreateTabItem("Armas")
    mostrar_armas_arsenal()
     ; Botões Armas
    Local $btn_equipar_arma = GUICtrlCreateButton("Equipar", 20, 550, 200, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_vender_arma = GUICtrlCreateButton("Vender", 220, 550, 200, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_sair_equipamentos_armas = GUICtrlCreateButton("Sair", 695, 550, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")


    GUICtrlCreateTabItem("Escudos")
    mostrar_escudos_arsenal()
    ; Botões Escudos
    Local $btn_equipar_escudo = GUICtrlCreateButton("Equipar", 20, 550, 200, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_vender_escudo = GUICtrlCreateButton("Vender", 220, 550, 200, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_sair_equipamentos_escudos = GUICtrlCreateButton("Sair", 695, 550, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")

    GUICtrlCreateTabItem("Capacetes")
    mostrar_capacetes_arsenal()
    ; Botões capacetes
    Local $btn_equipar_capacetes = GUICtrlCreateButton("Equipar", 20, 550, 200, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_vender_capacetes = GUICtrlCreateButton("Vender", 220, 550, 200, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_sair_equipamentos_capacetes = GUICtrlCreateButton("Sair", 695, 550, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")

    ;~ local $plano_fundo = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\arsenal.png", 0, 0, 800, 600)
    ;~ ; Move as imagens para o fundo
    ;~ GUICtrlSetState($plano_fundo, $GUI_DISABLE)
    
    GUISetState(@SW_SHOW, $tela_arsenal)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_equipamentos_armas, $btn_sair_equipamentos_escudos, $btn_sair_equipamentos_capacetes
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

Func mostrar_armas_arsenal()
    GUICtrlCreateListView("Espada | Ataque | Guerreiro", 20, 40, 400, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 200)
    _GUICtrlListView_SetColumnWidth(-1, 1, 50)
    _GUICtrlListView_SetColumnWidth(-1, 2, 140)


    GUICtrlCreateListViewItem("Escalibur | 2.0| Ananas raviezars",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)

    local $plano_fundo = GUICtrlCreatePic("D:\projetos\game_autoit_war\Imagens\Equipamentos\Armas\Espada_nivel_1.bmp", 430, 70, 350, 400)
    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)


EndFunc

Func mostrar_escudos_arsenal()
    GUICtrlCreateListView("Escudo | Defesa | Guerreiro", 20, 40, 400, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 200)
    _GUICtrlListView_SetColumnWidth(-1, 1, 50)
    _GUICtrlListView_SetColumnWidth(-1, 2, 140)


    GUICtrlCreateListViewItem("Madeira simples | 1.0| Ananas raviezars",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)

    local $plano_fundo = GUICtrlCreatePic("D:\projetos\game_autoit_war\Imagens\Equipamentos\Armas\Espada_nivel_1.bmp", 430, 70, 350, 400)
    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)

EndFunc

Func mostrar_capacetes_arsenal()
    GUICtrlCreateListView("Capacete | Defesa | Guerreiro", 20, 40, 400, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    GUICtrlSetColor(-1, $COLOR_DARKRED)
    _GUICtrlListView_SetColumnWidth(-1, 0, 200)
    _GUICtrlListView_SetColumnWidth(-1, 1, 50)
    _GUICtrlListView_SetColumnWidth(-1, 2, 140)


    GUICtrlCreateListViewItem("Gladiador | 1.0| Ananas raviezars",-1)
    GUICtrlSetBkColor(-1, $COLOR_CADETBLUE)

    local $plano_fundo = GUICtrlCreatePic("D:\projetos\game_autoit_war\Imagens\Equipamentos\Armas\Espada_nivel_1.bmp", 430, 70, 350, 400)
    ; Move as imagens para o fundo
    GUICtrlSetState($plano_fundo, $GUI_DISABLE)

EndFunc