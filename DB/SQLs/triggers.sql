CREATE TRIGGER IF NOT EXISTS cria_guerreiros_apos_cadastro
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO guerreiros (nome, ataque, defesa, inteligencia, forca, agilidade, idade)
    VALUES ("Hércules", ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, 0); 
	
	INSERT INTO guerreiros (nome, ataque, defesa, inteligencia, forca, agilidade, idade)
	VALUES ("Sansão", ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, 0); 
	
	INSERT INTO guerreiros (nome, ataque, defesa, inteligencia, forca, agilidade, idade)
	VALUES ("Perseu", ABS(RANDOM() % 11) + 5, ABS(RANDOM() % 11) + 5, 1, 1, 1, 16, 0);  
END;