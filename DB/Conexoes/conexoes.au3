#include-once

Global $sDatabase = 'C:\autoit\game_autoit_war\DB\DB.db'
Global $hDatabase 

Func conecta_e_inicia_banco()
	_SQLite_Startup() ; chama DLL
	If @error Then Exit MsgBox(0, "Erro", "Erro ao iniciar SQLite, por favor, verifique sua DLL")
	; Conecta e abre o banco
	$sDatabase = 'C:\autoit\game_autoit_war\DB\DB.db'
	$hDatabase = _SQLite_Open($sDatabase)
    If @error Then Exit MsgBox($MB_ICONERROR, "Erro", "Erro ao abrir o banco de dados.")
EndFunc

Func desconecta_e_fecha_banco()
	; Fecha conexão
	_SQLite_Shutdown()
	_SQLite_Close($hDatabase)
EndFunc

;~ Func insert($sql)

;~ 	conecta_e_inicia_banco()
;~ 	$sSQL = "INSERT INTO imagens_recrutas (recruta_id, imagem) VALUES ('1', '" & $caminho_imagem & "');"

;~ 	_SQLite_Exec($hDatabase, $sSQL)
;~ 	If @error Then MsgBox($MB_ICONERROR, "Erro", "Erro ao inserir dados na tabela.")
;~ 	desconecta_e_fecha_banco()

;~ EndFunc

Func retorna_consulta_sql($sql)
	Local $hQuery, $aNames

	conecta_e_inicia_banco()

	_SQLite_Query(-1, $sql, $hQuery)
	_SQLite_FetchData($hQuery, $aNames)


	If IsArray($aNames) Then
		; Se houver resultados, mostrar uma mensagem de sucesso com o ID do jogador
		;MsgBox($MB_OK, "Sucesso", "Login bem-sucedido! ID do jogador: " & $aNames[0])
		;_ArrayDisplay($aNames)
	Else
		; Se não houver resultados, mostrar uma mensagem de erro
		MsgBox($MB_OK, "Erro", "Login ou senha incorretos!")
	EndIf

	_SQLite_QueryFinalize($hQuery)

	desconecta_e_fecha_banco()

	Return($aNames[0])

EndFunc