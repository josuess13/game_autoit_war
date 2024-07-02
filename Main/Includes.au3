#include-once

Global $tela_login, $input_login, $input_senha, $hDatabase
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
#include "C:\autoit\game_autoit_war\DB\Conexoes\conexoes.au3"
#include "C:\autoit\game_autoit_war\DB\Conexoes\conexoes_login.au3"

;If FileExists(@ScriptDir & "\..\DB\DB.db" ) Then MsgBox(0, "", "AAAAAAAAAAAA")