SET @N_MAX_ROOMS = 20;									#numero massimo di stanze, il minimo è 6
SET @N_MAX_OBJECTS_IN_ROOM = 4;

/*
CREATE TABLE users(											#la faccio con migration di laravel
	id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	gold_coin int DEFAULT 0,										(ALTER TABLE users ADD gold_coin int DEFAULT 0)
	remember_token varchar(100),
	created_at timestamp DEFAULT current_timestamp,
	updated_at timestamp
);
*/

# ogni utente si crea uno e un solo personaggio (non è specificato)
# nel gioco in sè in genere ogni persona ha un solo pg

/*
CREATE TABLE objects(								#elenco di tutti gli oggetti
	name varchar(255) PRIMARY KEY,
	defense_attack boolean,							#se vera è un oggetto difesa/attacco altrimenti è un consumabile
	att_bonus int,									#compreso tra -6 e 6
	def_bonus int,									#compreso tra -6 e 6
	per_bonus int,									#compreso tra -6 e 6
	hit_bonus int,									#compreso tra -6 e 6
	damage int 										#0 per difesa, >0 per attaccho, NULL per consumabili
);
*/
/*
CREATE TABLE characters(
	userId int(10) UNSIGNED,
	charName varchar(32),
	strenght int,
	intelligence int,
	agility int,
	costitution int,
	description varchar(255),
	attack int,								#li inserisco io e li aggiorno con trigger
	defense int,							#li inserisco io e li aggiorno con trigger
	perception int,							#li inserisco io e li aggiorno con trigger
	hit_points int ,						#li inserisco io e li aggiorno con trigger
	damage int,								#dato dall'arma posseduta
	experience_points int DEFAULT 0,
	total_damage int DEFAULT 0,				# servono per PE, devono essere >= 0
	total_rooms int DEFAULT 0,
	attackObject varchar(255),
	defenseObject varchar(255),
	PRIMARY KEY (charName, userId),
	FOREIGN KEY (userId) REFERENCES users(id) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (attackObject) REFERENCES objects(name) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (defenseObject) REFERENCES objects(name) ON DELETE cascade ON UPDATE cascade
);
*/
delimiter //
DROP TRIGGER IF EXISTS insert_att_def_per_hit//
CREATE TRIGGER insert_att_def_per_hit BEFORE INSERT ON characters FOR EACH ROW
BEGIN
	SET NEW.attack = CEILING((NEW.strenght+NEW.agility)/2);
	SET NEW.defense = CEILING((NEW.costitution+NEW.agility)/2);
	SET NEW.perception = NEW.intelligence;
	SET NEW.hit_points = NEW.costitution;
END//
delimiter ;

/*
delimiter //
DROP TRIGGER IF EXISTS update_att_def_per_hit//
CREATE TRIGGER update_att_def_per_hit BEFORE UPDATE ON characters FOR EACH ROW
BEGIN
	if((NEW.attack <> OLD.attack) OR (NEW.defense<> OLD.defense) OR (NEW.perception <> OLD.perception) OR (NEW.hit_points <> OLD.hit_points)) then
	SET NEW.attack = CEILING((NEW.strenght+NEW.agility)/2);
	SET NEW.defense = CEILING((NEW.costitution+NEW.agility)/2);
	SET NEW.perception = NEW.intelligence;
	SET NEW.hit_points = NEW.costitution;
	SET NEW.damage=0;
	end if;
END//
delimiter ;
*/

delimiter //
DROP TRIGGER IF EXISTS attack_object_selction//
CREATE TRIGGER attack_object_selction BEFORE UPDATE ON characters FOR EACH ROW 
BEGIN
	DECLARE att,def,per,hit,dam,oldatt,olddef,oldper,oldhit INT;
	DECLARE att_d,def_d,per_d,hit_d,dam_d,oldatt_d,olddef_d,oldper_d,oldhit_d INT;

	SET oldatt = IFNULL((SELECT att_bonus FROM objects WHERE name=OLD.attackObject),0);
	SET olddef = IFNULL((SELECT def_bonus FROM objects WHERE name=OLD.attackObject),0);
	SET oldper = IFNULL((SELECT per_bonus FROM objects WHERE name=OLD.attackObject),0);
	SET oldhit = IFNULL((SELECT hit_bonus FROM objects WHERE name=OLD.attackObject),0);
	
	SET att = IFNULL((SELECT att_bonus FROM objects WHERE name=NEW.attackObject),0);
	SET def = IFNULL((SELECT def_bonus FROM objects WHERE name=NEW.attackObject),0);
	SET per = IFNULL((SELECT per_bonus FROM objects WHERE name=NEW.attackObject),0);
	SET hit = IFNULL((SELECT hit_bonus FROM objects WHERE name=NEW.attackObject),0);
	SET dam = IFNULL((SELECT damage FROM objects WHERE name=NEW.attackObject),0);

	SET oldatt_d = IFNULL((SELECT att_bonus FROM objects WHERE name=OLD.defenseObject),0);
	SET olddef_d = IFNULL((SELECT def_bonus FROM objects WHERE name=OLD.defenseObject),0);
	SET oldper_d = IFNULL((SELECT per_bonus FROM objects WHERE name=OLD.defenseObject),0);
	SET oldhit_d = IFNULL((SELECT hit_bonus FROM objects WHERE name=OLD.defenseObject),0);

	SET att_d = IFNULL((SELECT att_bonus FROM objects WHERE name=NEW.defenseObject),0);
	SET def_d = IFNULL((SELECT def_bonus FROM objects WHERE name=NEW.defenseObject),0);
	SET per_d = IFNULL((SELECT per_bonus FROM objects WHERE name=NEW.defenseObject),0);
	SET hit_d = IFNULL((SELECT hit_bonus FROM objects WHERE name=NEW.defenseObject),0);

	SET NEW.attack = OLD.attack + att - oldatt + att_d - oldatt_d;
	SET NEW.defense = OLD.defense + def - olddef + def_d - olddef_d;
	SET NEW.perception = OLD.perception + per - oldper + per_d - oldper_d;
	IF(NEW.hit_points = OLD.hit_points) THEN
		SET NEW.hit_points = OLD.hit_points + hit - oldhit + hit_d - oldhit_d;
	END IF;
	SET NEW.damage = dam;
	
END//
delimiter ;

CREATE TABLE rooms(									#elenco di tutte le stanze, utilizzato per costruire il dungeon
	id INT AUTO_INCREMENT PRIMARY KEY,
	descrizione VARCHAR(510)
);

CREATE TABLE enemies(								#elenco di tutti i nemici
	name varchar(255) PRIMARY KEY,
	description varchar(255),
	attack int,
	defense int,
	hit_points int,
	damage int
);

CREATE TABLE char_objects(							#elenco degli oggetti che ha un personaggio
	id int AUTO_INCREMENT PRIMARY KEY,
	userId int(10) UNSIGNED NOT NULL,
	name_object varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
	id_character int(10) UNSIGNED NOT NULL,
	cardinality int,
	created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp NULL DEFAULT NULL,
	FOREIGN KEY (userId) REFERENCES users(id)  ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (name_object) REFERENCES objects(name) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (id_character) REFERENCES characters(id) ON DELETE cascade ON UPDATE cascade
);

delimiter //
DROP TRIGGER IF EXISTS check_objects_number//
CREATE TRIGGER check_objects_number BEFORE INSERT ON char_objects FOR EACH ROW
BEGIN
	DECLARE num_obj_char INT;
	DECLARE cost_user INT;

	SET cost_user = (SELECT costitution FROM characters WHERE userId = new.userId);
	SET num_obj_char = (SELECT SUM(cardinality) FROM char_objects WHERE id_character = new.id_character AND userId = new.userId);
	IF (cost_user < (num_obj_char + new.cardinality)) THEN
		SET new.userId=NULL;
	END IF;
END//
delimiter ;

CREATE TABLE game_users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	userId int(10) UNSIGNED UNIQUE,
	startRoom INT,
	endRoom INT,
	roomIn INT,										#dove si trova il character nel dungeon
	created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp NULL DEFAULT NULL,
	FOREIGN KEY (userId) REFERENCES users(id)  ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (startRoom) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (endRoom) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (roomIn) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade
);
#alter table game_users add column created_at timestamp default current_timestamp;
#alter table game_users add column updated_at timestamp default current_timestamp;


CREATE TABLE dungeonRoutes(							#collegamenti di tutte le stanze, con visibilità di ogni relativo passaggio e partenza e fine
	id INT AUTO_INCREMENT PRIMARY KEY,
	idGame INT,
	idStanza INT,
	linked INT,
    visibility BOOLEAN,
    created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp NULL DEFAULT NULL,
    UNIQUE(idGame,idStanza,linked),
    FOREIGN KEY (idStanza) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade,
    FOREIGN KEY (linked) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade,
    FOREIGN KEY (idGame) REFERENCES game_users(id) ON DELETE cascade ON UPDATE cascade,
    INDEX gameInd_of_route (idGame)
);

/*
CREATE TABLE objectInRooms(							#oggetti contenuti in ogni stanza
	id INT AUTO_INCREMENT PRIMARY KEY,
	idGame INT,
	idRoom INT,
	objectName varchar(255),
	visibility BOOLEAN,								#true si vede, false è nascosto
	UNIQUE(idGame,idRoom,objectName),
	FOREIGN KEY (idRoom) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (objectName) REFERENCES objects(name) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (idGame) REFERENCES game_users(id) ON DELETE cascade ON UPDATE cascade,
	INDEX gameInd_of_object_room (idGame)
);
*/
ALTER TABLE objectInRooms ADD FOREIGN KEY (idRoom) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade;
ALTER TABLE objectInRooms ADD FOREIGN KEY (idGame) REFERENCES game_users(id) ON DELETE cascade ON UPDATE cascade;

CREATE TABLE enemieInRooms(
	id int AUTO_INCREMENT PRIMARY KEY,
	idGame INT,
	idRoom INT,
	enemieName varchar(255),
	attack int,
	defense int,
	hit_points int,
	damage int,
	created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp NULL DEFAULT NULL,
	FOREIGN KEY (idRoom) REFERENCES rooms(id) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (enemieName) REFERENCES enemies(name) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (idGame) REFERENCES game_users(id) ON DELETE cascade ON UPDATE cascade,
	INDEX gameInd_of_object_room (idGame)
);

CREATE TABLE consumables(
	userId INT(10) UNSIGNED PRIMARY KEY,
	att_bonus int,									#compreso tra -6 e 6
	def_bonus int,									#compreso tra -6 e 6
	per_bonus int,									#compreso tra -6 e 6
	hit_bonus int,									#compreso tra -6 e 6
	FOREIGN KEY (userId) REFERENCES users(id)  ON DELETE cascade ON UPDATE cascade
);
/*
CREATE TABLE markets(
	id INT AUTO_INCREMENT PRIMARY KEY,
	userId INT(10) UNSIGNED,
	objectName varchar(255),
	price INT,
	FOREIGN KEY (objectName) REFERENCES objects(name) ON DELETE cascade ON UPDATE cascade,
	FOREIGN KEY (userId) REFERENCES users(id) ON DELETE cascade ON UPDATE cascade
);
*/