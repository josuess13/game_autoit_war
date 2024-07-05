#include-once

Func tela_recrutar_guerreiros()

    Global $tela_recrutar_guerreiros = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_recrutar_guerreiros, "",0)
    GUISetBkColor(0x778899)

    listar_recrutas()

    ; Cards
    GUICtrlCreateGroup("16 Anos", 485, 430, 300, 100)
    GUICtrlSetFont(-1, 18, 700, 0, "Arial Black")
    GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

    ; Botões
    Local $btn_recrutar_guerreiro = GUICtrlCreateButton("Recrutar", 490, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_recusar_guerreiro = GUICtrlCreateButton("Recusar", 590, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_sair_guerreiro = GUICtrlCreateButton("Sair", 690, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    
    GUISetState(@SW_SHOW, $tela_recrutar_guerreiros)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_guerreiro
                GUIDelete($tela_recrutar_guerreiros)
                tela_principal()
                ExitLoop
            Case $btn_recrutar_guerreiro
                GUISetState(@SW_DISABLE, $tela_recrutar_guerreiros)
                promover_recruta()
                GUISetState(@SW_ENABLE, $tela_recrutar_guerreiros)
            Case identifica_recruta_selecionado() <> "Sem_imagem"
                If $recruta_selecionado <> identifica_recruta_selecionado() Then
                    mostrar_imagem_recruta(identifica_recruta_selecionado())
                    $recruta_selecionado = identifica_recruta_selecionado()
                    If $recruta_selecionado <> 1 And $recruta_selecionado <> "Sem_imagem" Then 
                        mostrar_card_recruta($recruta_selecionado)
                    EndIf
                EndIf
        EndSwitch
    WEnd

EndFunc

Func identifica_recruta_selecionado()
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_guerreiros_recrutas)

    If $Index == "" Then Return("Sem_imagem")

    $index = Number($index)
    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_guerreiros_recrutas, $index)
    Return $texto_do_item
EndFunc

Func mostrar_imagem_recruta($nome)

    Local $caminho_sql = "Guerreiros\consulta_imagem_recruta.sql"
    FileOpen($caminho_sql)
    Local $select =  FileRead($caminho_sql) & "'" & $nome & "'"
    FileClose($caminho_sql)

    Local $caminho_imagem = retorna_consulta_sql($select)
    
    $imagem_recruta = GUICtrlCreatePic($caminho_imagem, 485, 20, 300, 400)
    If @error Then 
        MsgBox(0, "", "Erro ao mostrar imagem")
    Else
        GUICtrlSetState($imagem_recruta, $GUI_DISABLE)
        $teste = 1
    EndIf
EndFunc

Func promover_recruta()
    Local $promover_a_guerreiro = mensagem_sim_ou_nao("Deseja cadastrar o jogador?", 0x800000, $COLOR_WHITESMOKE, $COLOR_WHITE)
    If $promover_a_guerreiro == "Não" Then Return
    
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_guerreiros_recrutas)
    If $Index == "" Then
		mensagem_aviso("Selecione um guerreiro para recrutar!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
		Return
	EndIf

    $index = Number($index)
    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_guerreiros_recrutas, $index)
    insert('update recrutas set status_recruta = 1 where nome = "' & $texto_do_item & '"')
    mensagem_aviso("Guerreiro promovido com sucesso!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)

    GUICtrlDelete($imagem_recruta)
    GUICtrlDelete($listar_guerreiros_recrutas)
    listar_recrutas()
EndFunc

Func mostrar_card_recruta($recruta)
    local $sexo_recruta = retorna_consulta_sql('select sexo from recrutas where nome = "' & $recruta_selecionado & '"')
    If $sexo_recruta == "M" Then $sexo_recruta = "o"
    If $sexo_recruta == "F" Then $sexo_recruta = "a"

    $descricao_recruta = GUICtrlCreateLabel("Guerreir" & $sexo_recruta & " forte e pront" & $sexo_recruta & " para a luta", 490, 465, 290, 60)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    GUICtrlSetColor(-1, $COLOR_ALICEBLUE)
EndFunc

Func listar_recrutas()
; Grid
    
    $listar_guerreiros_recrutas = GUICtrlCreateListView("Guerreiro | Ataque | Defesa | Inteligência | Força | Agilidade", 20, 20, 455, 560)
    
    conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
    Local $consulta_recrutas = 'select nome, ataque, defesa, inteligencia, forca, agilidade from recrutas where id_jogador = (SELECT id FROM jogadores WHERE login = "' & $usuario_logado &'");'
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $consulta_recrutas, $aResult, $iRows, $aNames)
    desconecta_e_fecha_banco()

    For $i = 0 To $iRows -1
		GUICtrlCreateListViewItem($aResult[$i][0] & "|" & $aResult[$i][1] & "|" & $aResult[$i][2] & "|" & $aResult[$i][3] & "|" & $aResult[$i][4] & "|" & $aResult[$i][5] & "|", $listar_guerreiros_recrutas)
	Next

    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 0, 120)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 1, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 2, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 3, 80)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 4, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros_recrutas, 5, 70)
	_GUICtrlListView_SetTextBkColor($listar_guerreiros_recrutas, 0xE0E0E0)
	_GUICtrlListView_SetBkColor($listar_guerreiros_recrutas, 0xFFFFFF)
	_GUICtrlListView_SetTextColor($listar_guerreiros_recrutas, 0x000000)
EndFunc