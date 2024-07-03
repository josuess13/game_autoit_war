#include-once

Func conecta_e_inicia_banco()
	_SQLite_Startup() ; chama DLL
	If @error Then Exit MsgBox(0, "Erro", "Erro ao iniciar SQLite, por favor, verifique sua DLL")
	; Conecta e abre o banco
	$hDatabase = _SQLite_Open($sDatabase)
    If @error Then Exit MsgBox($MB_ICONERROR, "Erro", "Erro ao abrir o banco de dados.")
EndFunc

Func desconecta_e_fecha_banco()
	; Fecha conexão
	_SQLite_Shutdown()
	_SQLite_Close($hDatabase)
EndFunc

Func insert($sql)
	conecta_e_inicia_banco()
	_SQLite_Exec($hDatabase, $sql)
	If @error Then MsgBox($MB_ICONERROR, "Erro", "Erro ao inserir dados na tabela.")
	desconecta_e_fecha_banco()
EndFunc

Func retorna_consulta_sql($sql)
	Local $hQuery, $aNames
	conecta_e_inicia_banco()
	_SQLite_Query(-1, $sql, $hQuery)
	_SQLite_FetchData($hQuery, $aNames)
	If Not IsArray($aNames) Then MsgBox($MB_OK, "Erro", "Erro ao retornar dados")
	_SQLite_QueryFinalize($hQuery)
	desconecta_e_fecha_banco()
	Return($aNames[0])
EndFunc

Func retorna_consulta_tabela_sql($sql)
	conecta_e_inicia_banco()
	Local $aResult, $iRows, $aNames
	Local $faz_consulta = _SQLite_GetTableData2D($hDatabase, $sql, $aResult, $iRows, $aNames)
	desconecta_e_fecha_banco()
	Local $retorno[2] = [$iRows, $aResult]
	Return($retorno)
EndFunc