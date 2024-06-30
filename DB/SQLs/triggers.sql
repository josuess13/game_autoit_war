CREATE TRIGGER IF NOT EXISTS cria_guerreiros_apos_cadastro
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