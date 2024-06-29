CREATE TABLE "usuarios" (  -- 1
	"id"	INTEGER NOT NULL,
	"login"	TEXT NOT NULL,
	"senha"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "recrutas" ( -- 2
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	REAL NOT NULL,
	"agilidade"	REAL NOT NULL,
	"idade"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "imagens_recrutas" (
	"id"	INTEGER NOT NULL,
	"recruta_id"	INTEGER NOT NULL,
	"imagem"	BLOB NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "guerreiros" (
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	REAL NOT NULL,
	"agilidade"	REAL NOT NULL,
	"idade"	INTEGER NOT NULL,
    "vitorias"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "imagens_guerreiros_recrutas" (
	"id"	INTEGER NOT NULL,
	"imagem"	BLOB NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);