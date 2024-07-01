#include-once

Func validar_login_e_senha()
    conecta_e_inicia_banco()
    

    Local $captura_login =  ControlGetText($tela_login, "", $input_login)
    Local $captura_senha =  ControlGetText($tela_login, "", $input_senha)


    If $captura_login == "" or $captura_senha == "" Then 
        mensagem_aviso("Login ou Senha inválidos!", 0x1E69D2, $COLOR_WHITESMOKE, $COLOR_WHITE)
        desconecta_e_fecha_banco()
        Return
    EndIf

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
