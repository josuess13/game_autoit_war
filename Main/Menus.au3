Func criar_menus()

    Global $menu_guerreiro = GUICtrlCreateMenu("Guerreiros")
    Global $submenu_guerreiros_seus_guerreiros = GUICtrlCreateMenuItem("Seus Guerreiros", $menu_guerreiro)
    Global $submenu_guerreiros_recrutar = GUICtrlCreateMenuItem("Recrutar", $menu_guerreiro)
    Global $submenu_guerreiros_guerreiros_rivais = GUICtrlCreateMenuItem("Guerreiros Rivais", $menu_guerreiro)

    Global $menu_equipamentos = GUICtrlCreateMenu("Equipamentos")
    Global $submenu_equipamentos_arsenal = GUICtrlCreateMenuItem("Arsenal", $menu_equipamentos)
    Global $submenu_equipamentos_armas = GUICtrlCreateMenuItem("Armas", $menu_equipamentos)
    Global $submenu_equipamentos_escudos = GUICtrlCreateMenuItem("Escudos", $menu_equipamentos)
    Global $submenu_equipamentos_Capacetes = GUICtrlCreateMenuItem("Capacetes", $menu_equipamentos)

    Global $menu_cavalos = GUICtrlCreateMenu("Cavalos")
    Global $submenu_cavalos_seu_estabulo = GUICtrlCreateMenuItem("Seu Estábulo", $menu_cavalos)
    Global $submenu_cavalos_mercado = GUICtrlCreateMenuItem("Mercado", $menu_cavalos)
    
    Global $menu_treino = GUICtrlCreateMenu("Treino")
    Global $submenu_treino_ataque = GUICtrlCreateMenuItem("Ataque", $menu_treino)
    Global $submenu_treino_defesa = GUICtrlCreateMenuItem("Defesa", $menu_treino)
    Global $submenu_treino_inteligencia = GUICtrlCreateMenuItem("Inteligência", $menu_treino)
    Global $submenu_treino_forca = GUICtrlCreateMenuItem("Força", $menu_treino)
    Global $submenu_treino_agilidade = GUICtrlCreateMenuItem("Agilidade", $menu_treino)

    Global $menu_arena = GUICtrlCreateMenu("Arena")
    Global $submenu_arena_desafios = GUICtrlCreateMenuItem("Desafios", $menu_arena)
    Global $submenu_arena_guerreiros = GUICtrlCreateMenuItem("Guerreiros", $menu_arena)

    Global $menu_mercado = GUICtrlCreateMenu("Mercado")
    Global $submenu_mercado_equipamentos = GUICtrlCreateMenuItem("Equipamentos", $menu_mercado)
    Global $submenu_mercado_treino = GUICtrlCreateMenuItem("Treino", $menu_mercado)
    Global $submenu_mercado_cavalos = GUICtrlCreateMenuItem("Cavalos", $menu_mercado)

    Global $menu_ferreiro = GUICtrlCreateMenu("Ferreiro")
    Global $submenu_ferreiro_ferreiros = GUICtrlCreateMenuItem("Ferreiros", $menu_ferreiro)

    Global $menu_castelo = GUICtrlCreateMenu("Castelo")
    Global $submenu_castelo_castelos = GUICtrlCreateMenuItem("Castelos", $menu_castelo)
    Global $submenu_castelo_seu_castelo = GUICtrlCreateMenuItem("Seu Castelo", $menu_castelo)

    Global $menu_guerra = GUICtrlCreateMenu("Guerra")
    Global $submenu_guerra_guerra = GUICtrlCreateMenuItem("Guerra", $menu_guerra)

    Global $menu_sair = GUICtrlCreateMenu("Sair")
    Global $submenu_sair_sair = GUICtrlCreateMenuItem("Sair", $menu_sair)

EndFunc