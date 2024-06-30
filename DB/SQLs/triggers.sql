CREATE TRIGGER IF NOT EXISTS cria_recrutas_apos_cadastro
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO recrutas (nome, ataque, defesa, inteligencia, forca, agilidade, idade, caminho_imagem, status_recruta)
    VALUES ("Hércules", ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, "C:\", 0); 
	
	INSERT INTO recrutas (nome, ataque, defesa, inteligencia, forca, agilidade, idade, caminho_imagem, status_recruta)
	VALUES ("Sansão", ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, "C:\", 0); 
	
	INSERT INTO recrutas (nome, ataque, defesa, inteligencia, forca, agilidade, idade, caminho_imagem, status_recruta)
	VALUES ("Perseu", ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, "C:\", 0);  
END;


CREATE TRIGGER IF NOT EXISTS transforma_recruta_em_guerreiro
AFTER UPDATE ON recrutas
WHEN recrutas.status_recruta = 1
BEGIN
	INSERT INTO guerreiros(nome, ataque, defesa, inteligencia, forca, agilidade, idade, caminho_imagem, vitorias)
	VALUES(recrutas.nome, recrutas.ataque, recrutas.defesa, recrutas.inteligencia, recrutas.forca, recrutas.agilidade, recrutas.idade, recrutas.caminho_imagem, 0)
END;

CREATE TRIGGER gera_recruta
AFTER UPDATE OF dias_jogados ON jogadores
FOR EACH ROW
WHEN NEW.dias_jogados % 10 = 0
BEGIN
    INSERT INTO recrutas (nome, ataque, defesa, inteligencia, forca, agilidade, idade, caminho_imagem, status_recruta)
    SELECT
	(SELECT nome FROM nomes ORDER BY RANDOM() LIMIT 1) || ' ' || 
    (SELECT sobrenome FROM sobrenomes ORDER BY RANDOM() LIMIT 1) AS nome,
	NEW.id,
	ABS(RANDOM() % 11) + 5 AS ataque,
	ABS(RANDOM() % 11) + 5 AS defesa,
	1, 1, 1, 16,
	-- imagem no db,
	0
END;