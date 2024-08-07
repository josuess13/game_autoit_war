#include-once

Func tela_escudos()

    Global $tela_escudos = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_escudos, "",0)
    GUISetBkColor(0x778899)

    mostrar_escudos()

    ; Botões Armas
    Local $btn_comprar_capacete = GUICtrlCreateButton("Comprar", 20, 540, 400, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")

    Local $btn_sair_equipamentos = GUICtrlCreateButton("Sair", 430, 540, 350, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    
    GUISetState(@SW_SHOW, $tela_escudos)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_equipamentos
                GUIDelete($tela_escudos)
                tela_principal()
                ExitLoop
            Case identifica_escudo_selecionado() <> "Sem_imagem"
                If $escudo_selecionado <> identifica_escudo_selecionado() Then
                    mostrar_imagem_escudo(identifica_escudo_selecionado())
                    $escudo_selecionado = identifica_escudo_selecionado()
                EndIf
        EndSwitch
    WEnd

EndFunc

Func identifica_escudo_selecionado()
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_escudos)

    If $Index == "" Then Return("Sem_imagem")

    $index = Number($index)
    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_escudos, $index)
    Return $texto_do_item
EndFunc

Func mostrar_imagem_escudo($nome)
    If $imagem_escudo <> 2 Then GUICtrlDelete($imagem_escudo) 
    
    Local $select = "select caminho_imagem from equipamentos where nome = '" & $nome &"'"

    Local $caminho_imagem = retorna_consulta_sql($select)
    
    $imagem_escudo = GUICtrlCreatePic($caminho_imagem, 500, 20, 280, 300)
    If @error Then 
        MsgBox(0, "", "Erro ao mostrar imagem")
    Else
        GUICtrlSetState($imagem_escudo, $GUI_DISABLE)
    EndIf
EndFunc

Func mostrar_escudos()
    $listar_escudos = GUICtrlCreateListView("Arma | Ataque | Defesa | Nível | Preço", 20, 20, 470, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    
    conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
    Local $consulta_armas = 'select nome, ataque, defesa, nivel, preco_compra from equipamentos where status_equipamento = 1 and tipo = 2;'
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $consulta_armas, $aResult, $iRows, $aNames)
    desconecta_e_fecha_banco()
    
    For $i = 0 To $iRows -1
		GUICtrlCreateListViewItem($aResult[$i][0] & "|" & $aResult[$i][1] & "|" & $aResult[$i][2] & "|" & $aResult[$i][3] & "|" & $aResult[$i][4] & "|", $listar_escudos)
	Next
    
    _GUICtrlListView_SetColumnWidth($listar_escudos, 0, 180)
    _GUICtrlListView_SetColumnWidth($listar_escudos, 1, 70)
    _GUICtrlListView_SetColumnWidth($listar_escudos, 2, 70)
    _GUICtrlListView_SetColumnWidth($listar_escudos, 3, 50)
    _GUICtrlListView_SetColumnWidth($listar_escudos, 4, 95)
EndFunc