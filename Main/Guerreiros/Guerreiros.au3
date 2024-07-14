#include-once

Func tela_guerreiros()

    Global $tela_guerreiros = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_guerreiros, "",0)
    GUISetBkColor(0x778899)

    listar_guerreiros()

    ; Botões
    Local $btn_lutar_guerreiro = GUICtrlCreateButton("Lutar", 20, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_Equipamento_guerreiro = GUICtrlCreateButton("Equipamento", 120, 540, 130, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_cavalo_guerreiro = GUICtrlCreateButton("Cavalo", 260, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_treino_guerreiro = GUICtrlCreateButton("Treino", 360, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    Local $btn_vender_guerreiro = GUICtrlCreateButton("Vender", 460, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")


    Local $btn_sair_guerreiro = GUICtrlCreateButton("Sair", 690, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    
    GUISetState(@SW_SHOW, $tela_guerreiros)

    While 1

        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE, $btn_sair_guerreiro
                GUIDelete($tela_guerreiros)
                tela_principal()
                ExitLoop
            Case identifica_guerreiro_selecionado() <> "Sem_imagem"
                If $guerreiro_selecionado <> identifica_guerreiro_selecionado() Then
                    mostrar_imagem_guerreiro(identifica_guerreiro_selecionado())
                    $guerreiro_selecionado = identifica_guerreiro_selecionado()
                EndIf
        EndSwitch
    WEnd

EndFunc

Func identifica_guerreiro_selecionado()
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_guerreiros)

    If $Index == "" Then Return("Sem_imagem")

    $index = Number($index)
    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_guerreiros, $index)
    Return $texto_do_item
EndFunc

Func mostrar_imagem_guerreiro($nome)
    If $imagem_guerreiro <> 2 Then GUICtrlDelete($imagem_guerreiro) 
    Local $caminho_sql = "Guerreiros\consulta_imagem_guerreiro.sql"
    FileOpen($caminho_sql)
    Local $select =  FileRead($caminho_sql) & "'" & $nome & "'"
    FileClose($caminho_sql)

    Local $caminho_imagem = retorna_consulta_sql($select)
    
    $imagem_guerreiro = GUICtrlCreatePic($caminho_imagem, 530, 0, 260, 350)
    If @error Then 
        MsgBox(0, "", "Erro ao mostrar imagem")
    Else
        GUICtrlSetState($imagem_guerreiro, $GUI_DISABLE)
    EndIf
EndFunc

Func listar_guerreiros()
; Grid
    
    $listar_guerreiros = GUICtrlCreateListView("Guerreiro | Ataque | Defesa | Inteligência | Força | Agilidade | Idade", 20, 20, 500, 500)
    
    conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
    Local $consulta_recrutas = 'select nome, ataque, defesa, inteligencia, forca, agilidade, idade from guerreiros where id_jogador = (SELECT id FROM jogadores WHERE login = "' & $usuario_logado &'");'
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $consulta_recrutas, $aResult, $iRows, $aNames)
    desconecta_e_fecha_banco()

    For $i = 0 To $iRows -1
		GUICtrlCreateListViewItem($aResult[$i][0] & "|" & $aResult[$i][1] & "|" & $aResult[$i][2] & "|" & $aResult[$i][3] & "|" & $aResult[$i][4] & "|" & $aResult[$i][5] & "|" & $aResult[$i][6] & "|", $listar_guerreiros)
	Next

    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 0, 120)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 1, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 2, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 3, 80)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 4, 60)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 5, 70)
    _GUICtrlListView_SetColumnWidth($listar_guerreiros, 6, 40)
	_GUICtrlListView_SetTextBkColor($listar_guerreiros, 0xE0E0E0)
	_GUICtrlListView_SetBkColor($listar_guerreiros, 0xFFFFFF)
	_GUICtrlListView_SetTextColor($listar_guerreiros, 0x000000)
EndFunc