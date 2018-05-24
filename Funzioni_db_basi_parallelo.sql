
## PROCEDURE

DELIMITER $$
DROP PROCEDURE IF EXISTS init$$
CREATE PROCEDURE init(IN id_user int(10) UNSIGNED)			#input= id dell'utente, che trovi in users table
BEGIN														#e infine la tabella objectInRooms, che contiene gli oggetti di ogni stanza
	DECLARE id_game INT;
	DECLARE  char_name varchar(255);

	START TRANSACTION;
	
	INSERT INTO game_users (userId) VALUES (id_user);
	SET id_game = (SELECT id FROM game_users WHERE userId=id_user);
	SET char_name = (SELECT charName FROM characters WHERE user_id=user_id);

	CALL initialize();
	CALL link(id_game);
	CALL putEnemieInRooms(id_game);
	CALL putObjectInRooms(id_game);

	COMMIT;
END$$
DELIMITER ;

#creo la tabelle temporanee che usero in link()

DELIMITER $$
DROP PROCEDURE IF EXISTS initialize$$
CREATE PROCEDURE initialize()
BEGIN
	DECLARE rnd INT;
	DECLARE c INT;
	DECLARE n_room INT;

	DROP TABLE IF EXISTS TEMPORARYgraph;					#elimino le tabelle temporanee se già esisitono
	DROP TABLE IF EXISTS TEMPORARYfoie;

	CREATE TABLE TEMPORARYgraph(
		cardinality INT AUTO_INCREMENT PRIMARY KEY,
		idRoomT INT
	);
	CREATE TABLE TEMPORARYfoie(
		cardinality INT AUTO_INCREMENT PRIMARY KEY,
		idRoomT INT
	);

	SET rnd = FLOOR((@N_MAX_ROOMS-5) * RAND() + 6);			#decido quante stanze ha il dungeon casualmente tra 6 e 15
	SET c = 1; 

	WHILE c <= (rnd-round(0.30 * rnd)) DO    				#creo una tabella di stanze che andrò a collegare in un grafo ciclico casualmente creato
															#e con un numero di stanze pari al 70% del totale di stanze scelte per in dungeon -rnd-
		REPEAT
			SET n_room = FLOOR((SELECT COUNT(*) FROM rooms) * RAND() + 1);			#scelgo casualmente una stanza dall'elenco delle rooms
			UNTIL NOT EXISTS(SELECT * FROM TEMPORARYgraph WHERE idRoomT = n_room)	#e controllo che non sia già presente nella tabella
		END REPEAT;
		
		INSERT INTO TEMPORARYgraph(idRoomT) VALUES (n_room);
		SET c = c + 1;
	END WHILE;

	SET c = 1;
	WHILE c <= (rnd-round(0.70 * rnd)) DO 					#creo una tabella temporanea di stanze che usero per fare le foglie del grafo
		
		REPEAT 
			SET n_room = FLOOR((SELECT COUNT(*) FROM rooms) * RAND() + 1);
			UNTIL NOT EXISTS(SELECT * FROM TEMPORARYfoie WHERE idRoomT = n_room) AND NOT EXISTS(SELECT * FROM TEMPORARYgraph WHERE idRoomT = n_room)
		END REPEAT;
		
		INSERT INTO TEMPORARYfoie(idRoomT) VALUES (n_room);
		SET c = c + 1;
	END WHILE;

END$$
DELIMITER ;

#popolo dungeonroutes

DELIMITER $$
DROP PROCEDURE IF EXISTS link$$
CREATE PROCEDURE link(IN id_game INT)
BEGIN
	DECLARE i INT;
	DECLARE idStanzaTMP INT;
	DECLARE randomLinks INT;
	DECLARE vis BOOLEAN;

	SET i = 1; 

	WHILE i <= (SELECT COUNT(*) FROM TEMPORARYgraph)-1 DO 
		SET idStanzaTMP = (SELECT idRoomT FROM TEMPORARYgraph WHERE cardinality = i);			#collego ogni stanza presente nel temporarygraph casualmente con la prima e la seconda successiva
		SET randomLinks = FLOOR(2 * RAND() + 1);												#scelgo se collerla solo alla successiva o anche alla seconda successiva
		SET vis = FLOOR(2 * RAND());															#decido se rendere il passaggio visibile

		WHILE randomLinks > 0 DO
			IF EXISTS (SELECT * FROM TEMPORARYgraph WHERE cardinality = (i+randomLinks)) THEN 	#mi accerto di non sforare dalla tabella andando a vedere 1 o 2 righe dopo
				INSERT INTO dungeonRoutes(idGame,idStanza, linked, visibility) VALUES (id_game,idStanzaTMP, (SELECT idRoomT FROM TEMPORARYgraph WHERE cardinality = (i+randomLinks)), vis);
			END IF;
			SET randomLinks = randomLinks - 1;
		END WHILE;
		
		SET i = i + 1;
	END WHILE;

	SET i = 1;

	WHILE i <= (SELECT COUNT(*) FROM TEMPORARYfoie) DO 											#aggiungo le foglie al grafo
		SET vis = FLOOR(2 * RAND());															#decido se rendere visibile il passaggio
		SET idStanzaTMP = (SELECT idRoomT FROM TEMPORARYfoie WHERE cardinality = i);			#prendo la stanza dalla tabella temporaryfoie
		SET randomLinks = FLOOR(((SELECT COUNT(*) FROM TEMPORARYgraph)-1) * RAND() + 1);		#scelgo una stanza a caso dal grafo a cui collegarla
		INSERT INTO dungeonRoutes(idGame,idStanza, linked, visibility) VALUES (id_game,idStanzaTMP, (SELECT idRoomT FROM TEMPORARYgraph WHERE cardinality = randomLinks), vis);
		SET i = i+1;
	END WHILE;

	
	SET idStanzaTMP = (SELECT idRoomT FROM TEMPORARYgraph ORDER BY idRoomT ASC LIMIT 1);		#decido la stanza di partenza e aggiorno game_users
	UPDATE game_users SET startRoom = idStanzaTMP WHERE id = id_game;

	SET idStanzaTMP = (SELECT idRoomT FROM TEMPORARYfoie ORDER BY idRoomT DESC LIMIT 1);		#decido la stanza di arrivo e aggiorno game_users
	UPDATE game_users SET endRoom = idStanzaTMP WHERE id = id_game;
	DELETE FROM TEMPORARYfoie WHERE idRoomT = idStanzaTMP;


END$$
DELIMITER ;

#procedura per inserire i nemici nelle stanze (il numero totale dei nemici è = a 1/4 del numero totale delle stanze)

DELIMITER $$
DROP PROCEDURE IF EXISTS putEnemieInRooms$$
CREATE PROCEDURE putEnemieInRooms(IN id_game INT)
BEGIN
	DECLARE c INT;
	DECLARE v INT;
	DECLARE temp INT;
	DECLARE enemie_row INT;
	DECLARE num_en INT;
	DECLARE room INT;
	DECLARE enemieName varchar(255);
	DECLARE attack_b INT;
	DECLARE defense_b INT;
	DECLARE hit_points_b INT;
	DECLARE damage_b INT;

	SET c = 0;
	SET v = (SELECT count(*) FROM (SELECT idRoomT FROM TEMPORARYgraph UNION SELECT idRoomT FROM TEMPORARYfoie) AS allRoom);
	SET num_en=(ROUND(v/4));
	WHILE c < num_en DO
		SET enemie_row= ROUND(RAND()*(SELECT COUNT(*) FROM enemies));
		SET enemieName = (SELECT name FROM enemies LIMIT enemie_row,1);
		SET attack_b = (SELECT attack FROM enemies WHERE name = enemieName);
		SET defense_b = (SELECT defense FROM enemies WHERE name = enemieName);
		SET hit_points_b = (SELECT hit_points FROM enemies WHERE name = enemieName);
		SET damage_b = (SELECT damage FROM enemies WHERE name = enemieName);
		SET temp = ROUND(RAND()*v)-1;
		SET room = (SELECT idRoomT FROM TEMPORARYgraph UNION SELECT idRoomT FROM TEMPORARYfoie LIMIT temp,1);

		INSERT INTO enemieInRooms(idGame,idRoom,enemieName,attack,defense,hit_points,damage) VALUES (id_game, room, enemieName, attack_b, defense_b, hit_points_b, damage_b);

		SET c = c + 1;
	END WHILE;

END$$
DELIMITER ;


#procedura per inserire oggetti nelle stanze, decidendo se renderli visibili o meno e quanti (al massimo @N_MAX_OBJECTS_IN_ROOM)

DELIMITER $$
DROP PROCEDURE IF EXISTS putObjectInRooms$$
CREATE PROCEDURE putObjectInRooms(IN id_game INT)
BEGIN
	DECLARE c INT;
	DECLARE i INT;
	DECLARE rnd INT;
	DECLARE row INT;
	DECLARE nameObject varchar(255);
	DECLARE roomChoose INT;
	DECLARE roomStart INT;
	DECLARE roomEnd INT;

	SET c =0;

	WHILE c < (SELECT count(*) FROM (SELECT idRoomT FROM TEMPORARYgraph UNION SELECT idRoomT FROM TEMPORARYfoie) AS roomChose) DO 				#scorro tutte le stanze scelte, che trovo unendo temporarygraph e temporaryfoie;
		SET rnd=ROUND(RAND()*@N_MAX_OBJECTS_IN_ROOM);											#quanti oggetti nella stanza
		SET i = 0;

		WHILE i < rnd DO 													#aggiungo alla stanza rnd oggetti

			REPEAT
				SET row=FLOOR(RAND()*(SELECT COUNT(*) FROM objects));		#scelgo la riga da cui prelevare l'oggetto
				SET nameObject = (SELECT name FROM objects LIMIT row,1);	#prendo il nome dell'oggetto alla riga row
				SET roomChoose = (SELECT idRoomT FROM TEMPORARYgraph UNION SELECT idRoomT FROM TEMPORARYfoie LIMIT c,1);
				UNTIL NOT EXISTS (SELECT * FROM objectInRooms WHERE objectName=nameObject AND idRoom=roomChoose AND idGame=id_game)		#mi assicuro che non ci sia gia l'associazione oggetto stanza
			END REPEAT;

			INSERT INTO objectInRooms (idGame,idRoom, objectName, visibility) VALUES (id_game,roomChoose, nameObject, ROUND(RAND()));		#inserisco in objectInRooms l'oggetto e la visibilita per la stanza considerata

			SET i = i +1;
		END WHILE;

		IF NOT EXISTS (SELECT * FROM objectInRooms WHERE objectName='Coin' AND idRoom=roomChoose AND idGame=id_game) THEN
			IF ( ROUND(RAND()) = 1) THEN
				SET roomChoose = (SELECT idRoomT FROM TEMPORARYgraph UNION SELECT idRoomT FROM TEMPORARYfoie LIMIT c,1);
				INSERT INTO objectInRooms (idGame,idRoom, objectName, visibility) VALUES (id_game, roomChoose, 'Coin', 1);
			END IF;
		END IF;
		SET c = c + 1;
	END WHILE;

	DROP TABLE IF EXISTS TEMPORARYgraph;					#elimino le tabelle temporanee
	DROP TABLE IF EXISTS TEMPORARYfoie;

END$$
DELIMITER ;


#procedura finale, alla conclusione della partita, per svuotare le tabelle: dungeonRoutes e objectInRooms (cosa facciamo con char_objects)
DELIMITER $$
DROP PROCEDURE IF EXISTS dropDungeon$$
CREATE PROCEDURE dropDungeon(IN id_game INT)
BEGIN
	DECLARE user_id int(10) UNSIGNED;
	DECLARE  char_name varchar(255);
	SET user_id=(SELECT userId FROM game_users WHERE Id=id_game);
	SET char_name = (SELECT charName FROM characters WHERE user_id=user_id);
	DELETE FROM game_users WHERE id=id_game;
	DELETE FROM objectInRooms WHERE idGame=id_game;
	DELETE FROM dungeonRoutes WHERE idGame=id_game;
	UPDATE characters SET defenseObject=NULL,attackObject=NULL WHERE user_id=user_id;
	UPDATE characters SET total_damage=0,total_rooms=0 WHERE user_id=user_id;
END$$
DELIMITER ;


