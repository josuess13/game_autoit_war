CREATE TRIGGER IF NOT EXISTS cria_recrutas_apos_cadastro
AFTER INSERT ON jogadores
FOR EACH ROW
BEGIN
	INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, status_recruta, sexo)
	VALUES(NEW.id, 'Sem nome', (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), 1, 1, 1, 16, 0, CASE WHEN (RANDOM() % 2) = 0 THEN 'M' ELSE 'F' END);

	INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, status_recruta, sexo)
	VALUES(NEW.id, 'Sem nome', (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), 1, 1, 1, 16, 0, CASE WHEN (RANDOM() % 2) = 0 THEN 'M' ELSE 'F' END);

	INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, status_recruta, sexo)
	VALUES(NEW.id, 'Sem nome', (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), 1, 1, 1, 16, 0, CASE WHEN (RANDOM() % 2) = 0 THEN 'M' ELSE 'F' END);
END;


CREATE TRIGGER IF NOT EXISTS associa_imagem_ao_recruta
AFTER INSERT ON recrutas
FOR EACH ROW
BEGIN
    -- Atualiza a imagem para recrutas femininos
    UPDATE recrutas
    SET imagem_recruta_femininos_id = (
        SELECT id FROM imagem_recruta_femininos ORDER BY RANDOM() LIMIT 1
    )
    WHERE NEW.id = recrutas.id AND NEW.sexo = 'F';

    -- Atualiza a imagem para recrutas masculinos
    UPDATE recrutas
    SET imagem_recruta_masculinos_id = (
        SELECT id FROM imagem_recruta_masculinos ORDER BY RANDOM() LIMIT 1
    )
    WHERE NEW.id = recrutas.id AND NEW.sexo = 'M';
END;

CREATE TRIGGER IF NOT EXISTS associa_nome_ao_recruta
AFTER INSERT ON recrutas
FOR EACH ROW
BEGIN
    -- Atualiza a imagem para recrutas femininos
    UPDATE recrutas
    SET nome = (
        (SELECT nome FROM nomes_femininos ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1)
    )
    WHERE NEW.id = recrutas.id AND NEW.sexo = 'F';

    -- Atualiza a imagem para recrutas masculinos
    UPDATE recrutas
    SET nome = (
        (SELECT nome FROM nomes_masculinos ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1)
    )
    WHERE NEW.id = recrutas.id AND NEW.sexo = 'M';
END;


CREATE TRIGGER IF NOT EXISTS transforma_recruta_em_guerreiro_e_deleta_recruta
AFTER UPDATE OF status_recruta ON recrutas
WHEN NEW.status_recruta = 1
BEGIN
	INSERT INTO guerreiros(id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, imagem_guerreiros_masculinos_id, imagem_guerreiros_femininos_id, vitorias, nivel, sexo)
	VALUES(new.id_jogador, NEW.nome, NEW.ataque, NEW.defesa, NEW.inteligencia, NEW.forca, NEW.agilidade, NEW.idade, NEW.imagem_recruta_masculinos_id, NEW.imagem_recruta_femininos_id, 0, 1, NEW.sexo);

    DELETE FROM recrutas WHERE nome = OLD.nome;
END;


CREATE TRIGGER IF NOT EXISTS gera_recruta
AFTER UPDATE OF dias_jogados ON jogadores
FOR EACH ROW
WHEN NEW.dias_jogados % 10 = 0 AND NEW.dias_jogados > 0
BEGIN
    INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, status_recruta, sexo)
	VALUES(NEW.id, 'Sem nome', (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), (SELECT valor FROM valores_5_a_10 ORDER BY RANDOM() LIMIT 1), 1, 1, 1, 16, 0, CASE WHEN (RANDOM() % 2) = 0 THEN 'M' ELSE 'F' END);
END;


CREATE TRIGGER IF NOT EXISTS corrige_nomes_recruta_duplicados
AFTER UPDATE OF nome ON recrutas
FOR EACH ROW
BEGIN
    -- Verifica e corrige nomes duplicados femininos
    UPDATE recrutas
    SET nome = (
        (SELECT nome FROM nomes_femininos ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1)
    )
    WHERE nome = NEW.nome AND id != NEW.id AND NEW.sexo = 'F';

    -- Verifica e corrige nomes duplicados masculinos
    UPDATE recrutas
    SET nome = (
        (SELECT nome FROM nomes_masculinos ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1)
    )
    WHERE nome = NEW.nome AND id != NEW.id AND NEW.sexo = 'M';
END;

CREATE TRIGGER IF NOT EXISTS corrige_nomes_guerreiros_duplicados
AFTER UPDATE OF nome ON guerreiros
FOR EACH ROW
BEGIN
    -- Verifica e corrige nomes duplicados femininos
    UPDATE guerreiros
    SET nome = (
        (SELECT nome FROM nomes_femininos ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1)
    )
    WHERE nome = NEW.nome AND id != NEW.id AND NEW.sexo = 'F';

    -- Verifica e corrige nomes duplicados masculinos
    UPDATE guerreiros
    SET nome = (
        (SELECT nome FROM nomes_masculinos ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1)
    )
    WHERE nome = NEW.nome AND id != NEW.id AND NEW.sexo = 'M';
END;