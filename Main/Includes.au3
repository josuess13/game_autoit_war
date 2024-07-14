#include-once

Global $tela_login, $input_login, $input_senha, $hDatabase, $usuario_logado
Global $imagem_recruta = 2, $recruta_selecionado = 1,  $descricao_recruta = 2, $listar_guerreiros_recrutas, $group_recrutas = 2
Global $imagem_guerreiro = 2, $guerreiro_selecionado = 1, $listar_guerreiros
Global $listar_armas, $imagem_arma = 2, $arma_selecionada = 1

Global $sDatabase = @ScriptDir & "\..\DB\DB.db"

#include <GUIConstantsEx.au3>
#include <FontConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <ColorConstants.au3>
#include <StaticConstants.au3>
#include <GuiListView.au3>

#include <Menus.au3>
#include <Main.au3>
#include <Mensagens.au3>

#include <SQLite.au3>
#include <SQLite.dll.au3>

#include "Guerreiros\Recrutar.au3"
#include "Guerreiros\Guerreiros.au3"
#include "Equipamentos\Arsenal.au3"
#include "Equipamentos\Armas.au3"
#include "Equipamentos\Escudos.au3"
#include "Equipamentos\Capacetes.au3"
#include "..\DB\Conexoes\conexoes.au3"
#include "..\DB\Conexoes\conexoes_login.au3"