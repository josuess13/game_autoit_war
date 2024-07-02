#include-once

Func validar_login_e_senha()
    
    Local $captura_login =  ControlGetText($tela_login, "", $input_login)
    Local $captura_senha =  ControlGetText($tela_login, "", $input_senha)

    If $captura_login == "" or $captura_senha == "" Then 
        mensagem_aviso("Login ou Senha inválidos!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
        Return
    EndIf

    conecta_e_inicia_banco()

    Local $valida_jogador = retorna_consulta_sql("select count(j.id) from jogadores j where j.login = '" & $captura_login & "' and j.senha = '" & $captura_senha & "' ; ")

    If $valida_jogador = 1 Then
        desconecta_e_fecha_banco()
        Return("OK")
    Else
        mensagem_aviso("Login ou Senha inválidos!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
        desconecta_e_fecha_banco()
        Return
    EndIf

EndFunc


Func cadastra_novo_jogador()

    Local $captura_login =  ControlGetText($tela_login, "", $input_login)
    Local $captura_senha =  ControlGetText($tela_login, "", $input_senha)

    If $captura_login == "" or $captura_senha == "" Then 
        mensagem_aviso("Informe um Login e Senha para continuar!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
        Return
    EndIf

    conecta_e_inicia_banco()

    Local $existe_jogador_com_login = retorna_consulta_sql("select count(j.id) from jogadores j where j.login = '" & $captura_login & "' ; ")

    If $existe_jogador_com_login = 1 Then
        mensagem_aviso("Já existe um jogador cadastrado com esse nome!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
        Return
    Else
        Local $opcao = MsgBox($MB_YESNO, "", "Deseja cadastrar o jogador?")
        If $opcao == $IDYES Then 
            MsgBox(0, "", "Usuário cadastrado com sucesso!")
            Return("Cadastrado")
        Else
            Return
        EndIf
    EndIf



EndFunc