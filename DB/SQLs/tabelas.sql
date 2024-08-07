CREATE TABLE IF NOT EXISTS "jogadores" (
	"id"	INTEGER NOT NULL,
	"login"	TEXT NOT NULL UNIQUE,
	"senha"	TEXT NOT NULL,
	"dias_jogados"	INTEGER NOT NULL,
	"dinheiro"	REAL NOT NULL,
	"nivel"	INTEGER NOT NULL,
	"ultimo_acesso" TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "imagem_recruta_masculinos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
 
-- Fazer os inserts para as imagens

CREATE TABLE IF NOT EXISTS "imagem_guerreiros_masculinos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "imagem_recruta_femininos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
 
-- Fazer os inserts para as imagens

CREATE TABLE IF NOT EXISTS "imagem_guerreiros_femininos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
-- Fazer os inserts para as imagens

CREATE TABLE IF NOT EXISTS "recrutas" (
	"id"	INTEGER NOT NULL,
	"id_jogador"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	REAL NOT NULL,
	"agilidade"	REAL NOT NULL,
	"idade"	INTEGER NOT NULL,
	"imagem_recruta_masculinos_id"	INTEGER,
	"imagem_recruta_femininos_id"	INTEGER,
	"status_recruta"	INTEGER NOT NULL,
	"sexo"	TEXT NOT NULL,
	FOREIGN KEY("imagem_recruta_masculinos_id") REFERENCES "imagem_recruta_masculinos"("id"),
	FOREIGN KEY("imagem_recruta_femininos_id") REFERENCES "imagem_recruta_femininos"("id"),
	FOREIGN KEY("id_jogador") REFERENCES "jogadores"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "guerreiros" (
	"id"	INTEGER NOT NULL,
	"id_jogador"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	REAL NOT NULL,
	"agilidade"	REAL NOT NULL,
	"idade"	INTEGER NOT NULL,
	"imagem_guerreiros_masculinos_id"	INTEGER,
	"imagem_guerreiros_femininos_id"	INTEGER,
    "vitorias"	INTEGER NOT NULL,
	"nivel"	INTEGER NOT NULL,
	"sexo"	TEXT NOT NULL, -- M Masculino, F Feminino
	FOREIGN KEY("imagem_guerreiros_masculinos_id") REFERENCES "imagem_guerreiros_masculinos"("id"),
	FOREIGN KEY("imagem_guerreiros_femininos_id") REFERENCES "imagem_guerreiros_femininos"("id"),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_jogador") REFERENCES "jogadores"("id")
);

CREATE TABLE IF NOT EXISTS "nomes_masculinos" (
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "nomes_femininos" (
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE  IF NOT EXISTS "sobrenomes" (
	"id"	INTEGER NOT NULL,
	"sobrenome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);


CREATE TABLE IF NOT EXISTS "valores_5_a_10"(
	"id"	INTEGER NOT NULL,
	"valor"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "tipos_equipamentos" (
	"id"	INTEGER NOT NULL,
	"tipo"	TEXT NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "equipamentos" (
	"id"	INTEGER NOT NULL,
	"tipo"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	NUMERIC,
	"defesa"	NUMERIC,
	"preco_compra"	NUMERIC NOT NULL,
	"preco_venda"	NUMERIC NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	"nivel"	INTEGER NOT NULL,
	"status_equipamento" INTEGER NOT NULL, -- 0 bloqueado, 1 disponível
	"dias_jogados" INTEGER NOT NULL,
	FOREIGN KEY("tipo") REFERENCES "tipos_equipamentos"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "equipamentos_comprados" (
	"id"	INTEGER NOT NULL,
	"tipo"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	NUMERIC,
	"defesa"	NUMERIC,
	"preco_compra"	NUMERIC NOT NULL,
	"preco_venda"	NUMERIC NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	"nivel"	INTEGER NOT NULL,
	"jogador_id"	INTEGER NOT NULL,
	FOREIGN KEY("tipo") REFERENCES "tipos_equipamentos"("id"),
	FOREIGN KEY("jogador_id") REFERENCES "jogadores"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "equipamentos_guerreiros"(
	"id"	INTEGER NOT NULL,
	"guerreiros_id" INTEGER NOT NULL,
	"equipamentos_comprados_id" INTEGER NOT NULL,
	FOREIGN KEY("guerreiros_id") REFERENCES "guerreiros"("id"),
	FOREIGN KEY("equipamentos_comprados_id") REFERENCES "equipamentos_comprados"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

