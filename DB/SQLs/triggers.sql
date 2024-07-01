CREATE TRIGGER IF NOT EXISTS cria_recrutas_apos_cadastro
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, imagem_recruta_id, status_recruta)
    VALUES (NEW.id,
	(SELECT nome FROM nomes ORDER BY RANDOM() LIMIT 1) || ' ' || 
    (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1) AS nome, 
	ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1,ELECT id FROM caminho_da_imagem_recrutas ORDER BY RANDOM() LIMIT 1
	, 0); 
	
	INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, imagem_recruta_id, status_recruta)
	VALUES (NEW.id,
	(SELECT nome FROM nomes ORDER BY RANDOM() LIMIT 1) || ' ' || 
    (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1) AS nome, 
	ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, 
	SELECT id FROM imagem_recrutas ORDER BY RANDOM() LIMIT 1
	, 0); 
	
	INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, imagem_recruta_id, status_recruta)
	VALUES (NEW.id,
	(SELECT nome FROM nomes ORDER BY RANDOM() LIMIT 1) || ' ' || 
    (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1) AS nome, 
	ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, 
	SELECT id FROM imagem_recrutas ORDER BY RANDOM() LIMIT 1
	, 0);  
END;

CREATE TRIGGER IF NOT EXISTS transforma_recruta_em_guerreiro
AFTER UPDATE OF status_recruta ON recrutas
WHEN NEW.status_recruta = 1
BEGIN
	INSERT INTO guerreiros(id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, imagem_guerreiro_id, vitorias, nivel)
	VALUES(new.id_jogador, NEW.nome, NEW.ataque, NEW.defesa, NEW.inteligencia, NEW.forca, NEW.agilidade, NEW.idade, NEW.imagem_recruta_id, 0, 1)
END;

CREATE TRIGGER gera_recruta
AFTER UPDATE OF dias_jogados ON jogadores
FOR EACH ROW
WHEN NEW.dias_jogados % 10 = 0
BEGIN
    INSERT INTO recrutas (id_jogador, nome, ataque, defesa, inteligencia, forca, agilidade, idade, imagem_recruta_id, status_recruta)
    VALUES (NEW.id,
	(SELECT nome FROM nomes ORDER BY RANDOM() LIMIT 1) || ' ' || (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1) AS nome,
	ABS(RANDOM() % 11) + 5 AS ataque,
	ABS(RANDOM() % 11) + 5 AS defesa,
	1, 1, 1, 16,
	SELECT id FROM imagem_recrutas ORDER BY RANDOM() LIMIT 1
	0);
END;