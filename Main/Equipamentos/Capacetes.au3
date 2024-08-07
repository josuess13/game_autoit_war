#include-once

Func tela_capacetes()

    Global $tela_capacetes = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_capacetes, "",0)
    GUISetBkColor(0x778899)

    mostrar_capacetes()

    ; Botões Armas
    Local $btn_comprar_capacete = GUICtrlCreateButton("Comprar", 20, 540, 400, 40)
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
                Case identifica_capacete_selecionado() <> "Sem_imagem"
                    If $capacete_selecionado <> identifica_capacete_selecionado() Then
                        mostrar_imagem_capacete(identifica_capacete_selecionado())
                        $capacete_selecionado = identifica_capacete_selecionado()
                    EndIf
                Case $btn_comprar_capacete
                    MsgBox(0, "", identifica_capacete_selecionado())
        EndSwitch
    WEnd

EndFunc

Func identifica_capacete_selecionado()
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_capacetes)

    If $Index == "" Then Return("Sem_imagem")

    $index = Number($index)
    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_capacetes, $index)
    Return $texto_do_item
EndFunc

Func mostrar_imagem_capacete($nome)
    If $imagem_capacete <> 2 Then GUICtrlDelete($imagem_capacete) 
    
    Local $select = "select caminho_imagem from equipamentos where nome = '" & $nome &"'"

    Local $caminho_imagem = retorna_consulta_sql($select)
    
    $imagem_capacete = GUICtrlCreatePic($caminho_imagem, 500, 20, 280, 300)
    If @error Then 
        MsgBox(0, "", "Erro ao mostrar imagem")
    Else
        GUICtrlSetState($imagem_capacete, $GUI_DISABLE)
    EndIf
EndFunc

Func mostrar_capacetes()
    $listar_capacetes = GUICtrlCreateListView("Capacete | Ataque | Defesa | Nível | Preço", 20, 20, 470, 500)
    GUICtrlSetBkColor(-1, $COLOR_BROWN)
    
    conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
    Local $consulta_armas = 'select nome, ataque, defesa, nivel, preco_compra from equipamentos where status_equipamento = 1 and tipo = 3;'
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $consulta_armas, $aResult, $iRows, $aNames)
    desconecta_e_fecha_banco()
    
    For $i = 0 To $iRows -1
		GUICtrlCreateListViewItem($aResult[$i][0] & "|" & $aResult[$i][1] & "|" & $aResult[$i][2] & "|" & $aResult[$i][3] & "|" & $aResult[$i][4] & "|", $listar_capacetes)
	Next
    
    _GUICtrlListView_SetColumnWidth($listar_capacetes, 0, 180)
    _GUICtrlListView_SetColumnWidth($listar_capacetes, 1, 70)
    _GUICtrlListView_SetColumnWidth($listar_capacetes, 2, 70)
    _GUICtrlListView_SetColumnWidth($listar_capacetes, 3, 50)
    _GUICtrlListView_SetColumnWidth($listar_capacetes, 4, 95)
EndFunc