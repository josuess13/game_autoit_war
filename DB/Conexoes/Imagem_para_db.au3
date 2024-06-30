#include <SQLite.au3>
#include <SQLite.dll.au3>

Global $sDatabase = @ScriptDir & '\..\DB.db'
Global $hDatabase 

Func conecta_e_inicia_banco()
	_SQLite_Startup() ; chama DLL
	If @error Then Exit MsgBox(0, "Erro", "Erro ao iniciar SQLite, por favor, verifique sua DLL")
	; Conecta e abre o banco
	$sDatabase = @ScriptDir & '\..\DB.db'
	$hDatabase = _SQLite_Open($sDatabase)
    If @error Then Exit MsgBox($MB_ICONERROR, "Erro", "Erro ao abrir o banco de dados.")
EndFunc

Func desconecta_e_fecha_banco()
	; Fecha conexão
	_SQLite_Shutdown()
	_SQLite_Close($hDatabase)
EndFunc

$caminho_imagem = "C:\autoit\game_autoit_war\Imagens\herois\Hercules_simples.bmp"

conecta_e_inicia_banco()
$sSQL = "INSERT INTO imagens_recrutas (recruta_id, imagem) VALUES ('1', '" & $caminho_imagem & "');"

_SQLite_Exec($hDatabase, $sSQL)
If @error Then MsgBox($MB_ICONERROR, "Erro", "Erro ao inserir dados na tabela.")
desconecta_e_fecha_banco()