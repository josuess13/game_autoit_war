#include-once

Func tela_armas()

    Global $tela_armas = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_armas, "",0)
    GUISetBkColor(0x778899)

    mostrar_armas()

    ; Botões Armas
    Local $btn_comprar_arma = GUICtrlCreateButton("Comprar", 20, 540, 470, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")

    Local $btn_sair_equipamentos = GUICtrlCreateButton("Sair", 500, 540, 280, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    
    GUISetState(@SW_SHOW, $tela_armas)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_equipamentos
                GUIDelete($tela_armas)
                tela_principal()
                ExitLoop
            Case identifica_arma_selecionada() <> "Sem_imagem"
                If $arma_selecionada <> identifica_arma_selecionada() Then
                    mostrar_imagem_arma(identifica_arma_selecionada())
                    $arma_selecionada = identifica_arma_selecionada()
                EndIf
            Case $btn_comprar_arma
                MsgBox(0, "", identifica_arma_selecionada())
        EndSwitch
    WEnd

EndFunc

Func identifica_arma_selecionada()
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_armas)

    If $Index == "" Then Return("Sem_imagem")

    $index = Number($index)
    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_armas, $index)
    Return $texto_do_item
EndFunc

Func mostrar_imagem_arma($nome)
    If $imagem_arma <> 2 Then GUICtrlDelete($imagem_arma) 
    
    Local $select = "select caminho_imagem from equipamentos where nome = '" & $nome &"'"

    Local $caminho_imagem = retorna_consulta_sql($select)
    
    $imagem_arma = GUICtrlCreatePic($caminho_imagem, 500, 20, 280, 300)
    If @error Then 
        MsgBox(0, "", "Erro ao mostrar imagem")
    Else
        GUICtrlSetState($imagem_arma, $GUI_DISABLE)
    EndIf
EndFunc

Func mostrar_armas()
    $listar_armas = GUICtrlCreateListView("Arma | Ataque | Defesa | Nível | Preço", 20, 20, 470, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    
    conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
    Local $consulta_armas = 'select nome, ataque, defesa, nivel, preco_compra from equipamentos where status_equipamento = 1 and tipo = 1;'
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $consulta_armas, $aResult, $iRows, $aNames)
    desconecta_e_fecha_banco()
    
    For $i = 0 To $iRows -1
		GUICtrlCreateListViewItem($aResult[$i][0] & "|" & $aResult[$i][1] & "|" & $aResult[$i][2] & "|" & $aResult[$i][3] & "|" & $aResult[$i][4] & "|", $listar_armas)
	Next
    
    _GUICtrlListView_SetColumnWidth($listar_armas, 0, 180)
    _GUICtrlListView_SetColumnWidth($listar_armas, 1, 70)
    _GUICtrlListView_SetColumnWidth($listar_armas, 2, 70)
    _GUICtrlListView_SetColumnWidth($listar_armas, 3, 50)
    _GUICtrlListView_SetColumnWidth($listar_armas, 4, 95)
EndFunc