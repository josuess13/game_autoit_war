#include <SQLite.au3>
#include <SQLite.dll.au3>

; Função para ler a imagem e retornar os dados binários
Func _ReadImage($sFilePath)
    Local $hFile = FileOpen($sFilePath, 16) ; Abrir o arquivo no modo binário
    If $hFile = -1 Then
        MsgBox(16, "Erro", "Não foi possível abrir o arquivo: " & $sFilePath)
        Return SetError(1, 0, 0)
    EndIf

    Local $iFileSize = FileGetSize($sFilePath)
    Local $vData = FileRead($hFile, $iFileSize)
    FileClose($hFile)
    Return $vData
EndFunc

; Caminho para o banco de dados SQLite
Local $sDB = "database.db"

; Inicializar SQLite
_SQLite_Startup()

; Conectar ao banco de dados
Local $hConn = _SQLite_Open($sDB)

; Verificar se a conexão foi bem-sucedida
If @error Then
    MsgBox(16, "Erro", "Não foi possível conectar ao banco de dados: " & $sDB)
    Exit
EndIf

; Criar a tabela, se não existir
Local $sCreateTable = "CREATE TABLE IF NOT EXISTS imagens_guerreiros_recrutas (" & _
                      "id INTEGER PRIMARY KEY," & _
                      "nome TEXT NOT NULL," & _
                      "imagens BLOB);"
_SQLite_Exec($hConn, $sCreateTable)

; Caminho do arquivo de imagem
Local $sImagePath = "caminho\para\sua\imagem.jpg"

; Ler a imagem
Local $vImageData = _ReadImage($sImagePath)
If @error Then Exit

; Preparar a consulta SQL de inserção
Local $sSQL = "INSERT INTO imagens_guerreiros_recrutas (nome, imagens) VALUES (?, ?);"
Local $hStmt = _SQLite_Prepare($hConn, $sSQL)

; Verificar se a preparação foi bem-sucedida
If @error Then
    MsgBox(16, "Erro", "Não foi possível preparar a consulta SQL.")
    _SQLite_Close($hConn)
    _SQLite_Shutdown()
    Exit
EndIf

; Bind dos parâmetros (nome e imagem)
_SQLite_BindText($hStmt, 1, "Nome do Guerreiro")
_SQLite_BindBlob($hStmt, 2, $vImageData, BinaryLen($vImageData))

; Executar a consulta
_SQLite_Step($hStmt)

; Finalizar a declaração
_SQLite_Finalize($hStmt)

; Fechar a conexão com o banco de dados
_SQLite_Close($hConn)

; Finalizar SQLite
_SQLite_Shutdown()

MsgBox(64, "Sucesso", "Imagem inserida com sucesso no banco de dados.")
