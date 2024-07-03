CREATE TABLE "jogadores" (
	"id"	INTEGER NOT NULL,
	"login"	TEXT NOT NULL UNIQUE,
	"senha"	TEXT NOT NULL,
	"dias_jogados"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "imagem_recruta_masculinos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
 
-- Fazer os inserts para as imagens

CREATE TABLE "imagem_guerreiros_masculinos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	"nivel"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE "imagem_recruta_femininos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
 
-- Fazer os inserts para as imagens

CREATE TABLE "imagem_guerreiros_femininos" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	"nivel"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);
-- Fazer os inserts para as imagens

CREATE TABLE "recrutas" (
	"id"	INTEGER NOT NULL,
	"id_jogador"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	NUMERIC NOT NULL,
	"agilidade"	NUMERIC NOT NULL,
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

CREATE TABLE "guerreiros" (
	"id"	INTEGER NOT NULL,
	"id_jogador"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	REAL NOT NULL,
	"agilidade"	REAL NOT NULL,
	"idade"	INTEGER NOT NULL,
	"imagem_guerreiro_id"	TEXT NOT NULL,
    "vitorias"	INTEGER NOT NULL,
	"nivel"	INTEGER NOT NULL,
	"sexo"	TEXT NOT NULL, -- M Masculino, F Feminino
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_jogador") REFERENCES "jogadores"("id")
);

CREATE TABLE "nomes_masculinos" (
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "nomes_femininos" (
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "sobrenomes" (
	"id"	INTEGER NOT NULL,
	"sobrenome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);


CREATE TABLE "valores_5_a_10"(
	"id"	INTEGER NOT NULL,
	"valor"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
)