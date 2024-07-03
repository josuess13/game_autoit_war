#include <Includes.au3>

If FileExists($sDatabase) Then FileDelete($sDatabase)
If @error Then 
    MsgBox(0, "", "Erro ao excluir banco")
    Exit
EndIf

Local $cria_db = _FileCreate($sDatabase)
If @error Then 
    MsgBox(0, "", "Erro ao criar banco")
    Exit
EndIf

FileOpen("..\DB\SQLs\tabelas.sql")
Local $tabelas = FileRead("..\DB\SQLs\tabelas.sql")
FileClose("..\DB\SQLs\tabelas.sql")

FileOpen("..\DB\SQLs\inserts.sql")
Local $inserts = FileRead("..\DB\SQLs\inserts.sql")
FileClose("..\DB\SQLs\inserts.sql")

FileOpen("..\DB\SQLs\triggers.sql")
Local $triggers = FileRead("..\DB\SQLs\triggers.sql")
FileClose("..\DB\SQLs\triggers.sql")

conecta_e_inicia_banco()
insert($tabelas)
insert($inserts)
insert($triggers)
desconecta_e_fecha_banco()