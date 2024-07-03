#include-once

Func tela_recrutar_guerreiros()

    Global $tela_recrutar_guerreiros = GUICreate("", 800, 600, -1, -1, BitOR($WS_POPUP, $WS_EX_LAYERED))
    WinSetOnTop($tela_recrutar_guerreiros, "",0)
    GUISetBkColor(0x778899)

    ; Grid
    Global $listar_guerreiros_recrutas = GUICtrlCreateListView("Guerreiro | Ataque | Defesa | Inteligência | Força | Agilidade", 20, 20, 455, 560)
    
    conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
    Local $consulta_recrutas = 'select nome, ataque, defesa, inteligencia, forca, agilidade from recrutas where id_jogador = (SELECT id FROM jogadores WHERE login = "' & $usuario_logado &'");'
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $consulta_recrutas, $aResult, $iRows, $aNames)
    desconecta_e_fecha_banco()

    For $i = 0 To $iRows -1
        MsgBox(0, "", $aResult[$i][0] & " - " & $aResult[$i][1] & " - " & $aResult[$i][2] & " - ")
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

    ; Imagem do guerreiro
    ;~ local $imagem_guerreiro = GUICtrlCreatePic(@ScriptDir & "\..\Imagens\herois\teste2.bmp", 485, 20, 300, 400)
    ;~ If @error Then MsgBox(0, "", "Erro ao mostrar imagem")
    ;~ GUICtrlSetState($imagem_guerreiro, $GUI_DISABLE)

    ;card
    GUICtrlCreateGroup("16 Anos", 485, 430, 300, 100)
    GUICtrlSetFont(-1, 18, 700, 0, "Arial Black")

    Local $descricao_guerreiro = GUICtrlCreateLabel("Guerreiro forte e pronto para a luta", 490, 465, 290, 60)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    GUICtrlSetColor(-1, $COLOR_ALICEBLUE)

    GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

    ; Botões
    $btn_recrutar_guerreiro = GUICtrlCreateButton("Recrutar", 490, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    $btn_recusar_guerreiro = GUICtrlCreateButton("Recusar", 590, 540, 90, 40)
    GUICtrlSetFont(-1, 12, "", 0, "Arial Black")
    $btn_sair_guerreiro = GUICtrlCreateButton("Sair", 690, 540, 90, 40)
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
                MsgBox(0, "", selecionar_guerreiro_para_recrutar_no_grid())
                GUISetState(@SW_ENABLE, $tela_recrutar_guerreiros)
        EndSwitch
    WEnd

EndFunc

Func selecionar_guerreiro_para_recrutar_no_grid()
    Local $index = _GUICtrlListView_GetSelectedIndices($listar_guerreiros_recrutas)

    If $Index == "" Then
		mensagem_aviso("Selecione um guerreiro para recrutar!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
		Return
	EndIf

    $index = Number($index)

    Local $texto_do_item = _GUICtrlListView_GetItemText($listar_guerreiros_recrutas, $index)
    
    Return $texto_do_item
EndFunc