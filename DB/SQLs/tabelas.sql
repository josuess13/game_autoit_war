CREATE TABLE "jogadores" (  -- 1
	"id"	INTEGER NOT NULL,
	"login"	TEXT NOT NULL,
	"senha"	TEXT NOT NULL,
	"dias_jogados"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "imagem_recruta" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
 
-- Fazer os inserts para as imagens

CREATE TABLE "imagem_guerreiros" ( 
	"id"	INTEGER NOT NULL,
	"caminho_imagem"	TEXT NOT NULL,
	"nivel"	INTEGER NOT NULL,
	PRIMARY KEY("id")
);

-- Fazer os inserts para as imagens

CREATE TABLE "recrutas" ( -- 2
	"id"	INTEGER NOT NULL,
	"id_jogador"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	"ataque"	REAL NOT NULL,
	"defesa"	REAL NOT NULL,
	"inteligencia"	REAL NOT NULL,
	"forca"	REAL NOT NULL,
	"agilidade"	REAL NOT NULL,
	"idade"	INTEGER NOT NULL,
	"imagem_recruta_id"	TEXT NOT NULL,
	"status_recruta"	INTEGER NOT NULL, -- 0 Disponível, 1 Recrutado
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_jogador") REFERENCES "jogadores"("id")
	FOREIGN KEY("imagem_recruta_id") REFERENCES "imagem_recruta"("id")
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
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_jogador") REFERENCES "jogadores"("id")
);

CREATE TABLE "nomes" (
	"id"	INTEGER NOT NULL,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO nomes(nome) VALUES('Achilles');
INSERT INTO nomes(nome) VALUES('Adonis');
INSERT INTO nomes(nome) VALUES('Ajax');
INSERT INTO nomes(nome) VALUES('Anastasios');
INSERT INTO nomes(nome) VALUES('Andreas');
INSERT INTO nomes(nome) VALUES('Antonios');
INSERT INTO nomes(nome) VALUES('Apollo');
INSERT INTO nomes(nome) VALUES('Argus');
INSERT INTO nomes(nome) VALUES('Aristotle');
INSERT INTO nomes(nome) VALUES('Atlas');
INSERT INTO nomes(nome) VALUES('Basil');
INSERT INTO nomes(nome) VALUES('Cassander');
INSERT INTO nomes(nome) VALUES('Damon');
INSERT INTO nomes(nome) VALUES('Dimitrios');
INSERT INTO nomes(nome) VALUES('Eros');
INSERT INTO nomes(nome) VALUES('Evander');
INSERT INTO nomes(nome) VALUES('Hector');
INSERT INTO nomes(nome) VALUES('Hermes');
INSERT INTO nomes(nome) VALUES('Icarus');
INSERT INTO nomes(nome) VALUES('Kyros');
INSERT INTO nomes(nome) VALUES('Leander');
INSERT INTO nomes(nome) VALUES('Leonidas');
INSERT INTO nomes(nome) VALUES('Midas');
INSERT INTO nomes(nome) VALUES('Nestor');
INSERT INTO nomes(nome) VALUES('Odysseus');
INSERT INTO nomes(nome) VALUES('Orpheus');
INSERT INTO nomes(nome) VALUES('Pallas');
INSERT INTO nomes(nome) VALUES('Paris');
INSERT INTO nomes(nome) VALUES('Perseus');
INSERT INTO nomes(nome) VALUES('Phoenix');
INSERT INTO nomes(nome) VALUES('Plato');
INSERT INTO nomes(nome) VALUES('Pyrrhus');
INSERT INTO nomes(nome) VALUES('Rhodes');
INSERT INTO nomes(nome) VALUES('Socrates');
INSERT INTO nomes(nome) VALUES('Solon');
INSERT INTO nomes(nome) VALUES('Thaddeus');
INSERT INTO nomes(nome) VALUES('Theo');
INSERT INTO nomes(nome) VALUES('Titan');
INSERT INTO nomes(nome) VALUES('Xander');
INSERT INTO nomes(nome) VALUES('Xenon');
INSERT INTO nomes(nome) VALUES('Zenon');
INSERT INTO nomes(nome) VALUES('Alexios');
INSERT INTO nomes(nome) VALUES('Cleon');
INSERT INTO nomes(nome) VALUES('Damian');
INSERT INTO nomes(nome) VALUES('Evangelos');
INSERT INTO nomes(nome) VALUES('Gregorios');
INSERT INTO nomes(nome) VALUES('Ilias');
INSERT INTO nomes(nome) VALUES('Lucian');
INSERT INTO nomes(nome) VALUES('Marios');
INSERT INTO nomes(nome) VALUES('Nikos');
INSERT INTO nomes(nome) VALUES('Agamemnon');
INSERT INTO nomes(nome) VALUES('Alcibiades');
INSERT INTO nomes(nome) VALUES('Anaxagoras');
INSERT INTO nomes(nome) VALUES('Antigonus');
INSERT INTO nomes(nome) VALUES('Archelaus');
INSERT INTO nomes(nome) VALUES('Aristarchus');
INSERT INTO nomes(nome) VALUES('Aristides');
INSERT INTO nomes(nome) VALUES('Aristophanes');
INSERT INTO nomes(nome) VALUES('Artaxerxes');
INSERT INTO nomes(nome) VALUES('Astyages');
INSERT INTO nomes(nome) VALUES('Bardiya');
INSERT INTO nomes(nome) VALUES('Cambyses');
INSERT INTO nomes(nome) VALUES('Cyrus');
INSERT INTO nomes(nome) VALUES('Darius');
INSERT INTO nomes(nome) VALUES('Datis');
INSERT INTO nomes(nome) VALUES('Demetrius');
INSERT INTO nomes(nome) VALUES('Ephialtes');
INSERT INTO nomes(nome) VALUES('Epictetus');
INSERT INTO nomes(nome) VALUES('Euripides');
INSERT INTO nomes(nome) VALUES('Gordias');
INSERT INTO nomes(nome) VALUES('Heraclitus');
INSERT INTO nomes(nome) VALUES('Herodotus');
INSERT INTO nomes(nome) VALUES('Hippocrates');
INSERT INTO nomes(nome) VALUES('Isocrates');
INSERT INTO nomes(nome) VALUES('Leonidas');
INSERT INTO nomes(nome) VALUES('Lycurgus');
INSERT INTO nomes(nome) VALUES('Miltiades');
INSERT INTO nomes(nome) VALUES('Minos');
INSERT INTO nomes(nome) VALUES('Nicias');
INSERT INTO nomes(nome) VALUES('Parmenides');
INSERT INTO nomes(nome) VALUES('Pausanias');
INSERT INTO nomes(nome) VALUES('Pericles');
INSERT INTO nomes(nome) VALUES('Phidias');
INSERT INTO nomes(nome) VALUES('Ptolemy');
INSERT INTO nomes(nome) VALUES('Pythagoras');
INSERT INTO nomes(nome) VALUES('Socrates');
INSERT INTO nomes(nome) VALUES('Solon');
INSERT INTO nomes(nome) VALUES('Sophonias');
INSERT INTO nomes(nome) VALUES('Spartacus');
INSERT INTO nomes(nome) VALUES('Strabo');
INSERT INTO nomes(nome) VALUES('Themistocles');
INSERT INTO nomes(nome) VALUES('Theocritus');
INSERT INTO nomes(nome) VALUES('Thucydides');
INSERT INTO nomes(nome) VALUES('Timon');
INSERT INTO nomes(nome) VALUES('Xerxes');
INSERT INTO nomes(nome) VALUES('Xanthippus');
INSERT INTO nomes(nome) VALUES('Zeno');
INSERT INTO nomes(nome) VALUES('Abel');
INSERT INTO nomes(nome) VALUES('Arash');
INSERT INTO nomes(nome) VALUES('Ardashir');
INSERT INTO nomes(nome) VALUES('Arezou');
INSERT INTO nomes(nome) VALUES('Aria');
INSERT INTO nomes(nome) VALUES('Bahram');
INSERT INTO nomes(nome) VALUES('Barbad');
INSERT INTO nomes(nome) VALUES('Behzad');
INSERT INTO nomes(nome) VALUES('Bijan');
INSERT INTO nomes(nome) VALUES('Dariush');
INSERT INTO nomes(nome) VALUES('Darab');
INSERT INTO nomes(nome) VALUES('Farhad');
INSERT INTO nomes(nome) VALUES('Farshad');
INSERT INTO nomes(nome) VALUES('Fereydoun');
INSERT INTO nomes(nome) VALUES('Giv');
INSERT INTO nomes(nome) VALUES('Gordafarid');
INSERT INTO nomes(nome) VALUES('Homayoun');
INSERT INTO nomes(nome) VALUES('Hormoz');
INSERT INTO nomes(nome) VALUES('Houshang');
INSERT INTO nomes(nome) VALUES('Jamsheed');
INSERT INTO nomes(nome) VALUES('Jamshid');
INSERT INTO nomes(nome) VALUES('Kaveh');
INSERT INTO nomes(nome) VALUES('Kayvan');
INSERT INTO nomes(nome) VALUES('Khosrow');
INSERT INTO nomes(nome) VALUES('Lohrasp');
INSERT INTO nomes(nome) VALUES('Maziar');
INSERT INTO nomes(nome) VALUES('Mehrdad');
INSERT INTO nomes(nome) VALUES('Mithra');
INSERT INTO nomes(nome) VALUES('Nader');
INSERT INTO nomes(nome) VALUES('Nasrin');
INSERT INTO nomes(nome) VALUES('Navid');
INSERT INTO nomes(nome) VALUES('Nezam');
INSERT INTO nomes(nome) VALUES('Nushin');
INSERT INTO nomes(nome) VALUES('Parviz');
INSERT INTO nomes(nome) VALUES('Ramin');
INSERT INTO nomes(nome) VALUES('Rashid');
INSERT INTO nomes(nome) VALUES('Rostam');
INSERT INTO nomes(nome) VALUES('Sam');
INSERT INTO nomes(nome) VALUES('Shahram');
INSERT INTO nomes(nome) VALUES('Shapur');
INSERT INTO nomes(nome) VALUES('Soroush');
INSERT INTO nomes(nome) VALUES('Sohrab');
INSERT INTO nomes(nome) VALUES('Tahmuras');
INSERT INTO nomes(nome) VALUES('Vahid');
INSERT INTO nomes(nome) VALUES('Vash');
INSERT INTO nomes(nome) VALUES('Yazdegerd');
INSERT INTO nomes(nome) VALUES('Zahhak');
INSERT INTO nomes(nome) VALUES('Zal');
INSERT INTO nomes(nome) VALUES('Zartosht');
INSERT INTO nomes(nome) VALUES('Zia');
INSERT INTO nomes(nome) VALUES('Zohreh');


CREATE TABLE "sobrenomes" (
	"id"	INTEGER NOT NULL,
	"sobrenome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO sobrenomes(sobrenome) VALUES('Lykaios');
INSERT INTO sobrenomes(sobrenome) VALUES('Andreas');
INSERT INTO sobrenomes(sobrenome) VALUES('Antonopoulos');
INSERT INTO sobrenomes(sobrenome) VALUES('Bakirtzis');
INSERT INTO sobrenomes(sobrenome) VALUES('Christodoulou');
INSERT INTO sobrenomes(sobrenome) VALUES('Demetriou');
INSERT INTO sobrenomes(sobrenome) VALUES('Efstathiou');
INSERT INTO sobrenomes(sobrenome) VALUES('Fotiadis');
INSERT INTO sobrenomes(sobrenome) VALUES('Georgiou');
INSERT INTO sobrenomes(sobrenome) VALUES('Hatzis');
INSERT INTO sobrenomes(sobrenome) VALUES('Iordanou');
INSERT INTO sobrenomes(sobrenome) VALUES('Katsaros');
INSERT INTO sobrenomes(sobrenome) VALUES('Laskaris');
INSERT INTO sobrenomes(sobrenome) VALUES('Mavros');
INSERT INTO sobrenomes(sobrenome) VALUES('Nikolaidis');
INSERT INTO sobrenomes(sobrenome) VALUES('Oikonomou');
INSERT INTO sobrenomes(sobrenome) VALUES('Papadopoulos');
INSERT INTO sobrenomes(sobrenome) VALUES('Raptis');
INSERT INTO sobrenomes(sobrenome) VALUES('Samaras');
INSERT INTO sobrenomes(sobrenome) VALUES('Tzimas');
INSERT INTO sobrenomes(sobrenome) VALUES('Vasiliou');
INSERT INTO sobrenomes(sobrenome) VALUES('Zografos');
INSERT INTO sobrenomes(sobrenome) VALUES('Argyris');
INSERT INTO sobrenomes(sobrenome) VALUES('Bakogiannis');
INSERT INTO sobrenomes(sobrenome) VALUES('Christakis');
INSERT INTO sobrenomes(sobrenome) VALUES('Doukas');
INSERT INTO sobrenomes(sobrenome) VALUES('Eliopoulos');
INSERT INTO sobrenomes(sobrenome) VALUES('Fountas');
INSERT INTO sobrenomes(sobrenome) VALUES('Galanis');
INSERT INTO sobrenomes(sobrenome) VALUES('Hatzidakis');
INSERT INTO sobrenomes(sobrenome) VALUES('Ioannidis');
INSERT INTO sobrenomes(sobrenome) VALUES('Katsoulis');
INSERT INTO sobrenomes(sobrenome) VALUES('Livanios');
INSERT INTO sobrenomes(sobrenome) VALUES('Michalakis');
INSERT INTO sobrenomes(sobrenome) VALUES('Nikitas');
INSERT INTO sobrenomes(sobrenome) VALUES('Papageorgiou');
INSERT INTO sobrenomes(sobrenome) VALUES('Rousakis');
INSERT INTO sobrenomes(sobrenome) VALUES('Sotiropoulos');
INSERT INTO sobrenomes(sobrenome) VALUES('Tzakis');
INSERT INTO sobrenomes(sobrenome) VALUES('Vlastos');
INSERT INTO sobrenomes(sobrenome) VALUES('Zervos');
INSERT INTO sobrenomes(sobrenome) VALUES('Aghassian');
INSERT INTO sobrenomes(sobrenome) VALUES('Ardalan');
INSERT INTO sobrenomes(sobrenome) VALUES('Bahmani');
INSERT INTO sobrenomes(sobrenome) VALUES('Bakhtiar');
INSERT INTO sobrenomes(sobrenome) VALUES('Chamani');
INSERT INTO sobrenomes(sobrenome) VALUES('Darvish');
INSERT INTO sobrenomes(sobrenome) VALUES('Ehsani');
INSERT INTO sobrenomes(sobrenome) VALUES('Farzan');
INSERT INTO sobrenomes(sobrenome) VALUES('Ghaffari');
INSERT INTO sobrenomes(sobrenome) VALUES('Hedayat');
INSERT INTO sobrenomes(sobrenome) VALUES('Jahanshah');
INSERT INTO sobrenomes(sobrenome) VALUES('Karimi');
INSERT INTO sobrenomes(sobrenome) VALUES('Kaviani');
INSERT INTO sobrenomes(sobrenome) VALUES('Mehrabi');
INSERT INTO sobrenomes(sobrenome) VALUES('Nafisi');
INSERT INTO sobrenomes(sobrenome) VALUES('Parvizi');
INSERT INTO sobrenomes(sobrenome) VALUES('Qorbani');
INSERT INTO sobrenomes(sobrenome) VALUES('Rostami');
INSERT INTO sobrenomes(sobrenome) VALUES('Shahbazi');
INSERT INTO sobrenomes(sobrenome) VALUES('Tabrizi');
INSERT INTO sobrenomes(sobrenome) VALUES('Vaziri');
INSERT INTO sobrenomes(sobrenome) VALUES('Yazdani');
INSERT INTO sobrenomes(sobrenome) VALUES('Zamani');
INSERT INTO sobrenomes(sobrenome) VALUES('Amir');
INSERT INTO sobrenomes(sobrenome) VALUES('Behrouz');
INSERT INTO sobrenomes(sobrenome) VALUES('Chaman');
INSERT INTO sobrenomes(sobrenome) VALUES('Dehghan');
INSERT INTO sobrenomes(sobrenome) VALUES('Esmaili');
INSERT INTO sobrenomes(sobrenome) VALUES('Fard');
INSERT INTO sobrenomes(sobrenome) VALUES('Ganjavi');
INSERT INTO sobrenomes(sobrenome) VALUES('Hosseini');
INSERT INTO sobrenomes(sobrenome) VALUES('Jafari');
INSERT INTO sobrenomes(sobrenome) VALUES('Khodadadi');
INSERT INTO sobrenomes(sobrenome) VALUES('Latifi');
INSERT INTO sobrenomes(sobrenome) VALUES('Mahdavi');
INSERT INTO sobrenomes(sobrenome) VALUES('Nassiri');
INSERT INTO sobrenomes(sobrenome) VALUES('Pahlavi');
INSERT INTO sobrenomes(sobrenome) VALUES('Rahimi');
INSERT INTO sobrenomes(sobrenome) VALUES('Sadri');
INSERT INTO sobrenomes(sobrenome) VALUES('Tajik');
INSERT INTO sobrenomes(sobrenome) VALUES('Zadeh');
INSERT INTO sobrenomes(sobrenome) VALUES('Ahmadi');
INSERT INTO sobrenomes(sobrenome) VALUES('Ashrafi');
INSERT INTO sobrenomes(sobrenome) VALUES('Bakhtiari');
INSERT INTO sobrenomes(sobrenome) VALUES('Cheraghchi');
INSERT INTO sobrenomes(sobrenome) VALUES('Djahani');
INSERT INTO sobrenomes(sobrenome) VALUES('Ebrahimi');
INSERT INTO sobrenomes(sobrenome) VALUES('Fahimi');
INSERT INTO sobrenomes(sobrenome) VALUES('Golshani');
INSERT INTO sobrenomes(sobrenome) VALUES('Hassani');
INSERT INTO sobrenomes(sobrenome) VALUES('Isfahani');
INSERT INTO sobrenomes(sobrenome) VALUES('Jalali');
INSERT INTO sobrenomes(sobrenome) VALUES('Kazemi');
INSERT INTO sobrenomes(sobrenome) VALUES('Mokhtari');
INSERT INTO sobrenomes(sobrenome) VALUES('Nasiri');
INSERT INTO sobrenomes(sobrenome) VALUES('Pirooz');
INSERT INTO sobrenomes(sobrenome) VALUES('Rostamian');
