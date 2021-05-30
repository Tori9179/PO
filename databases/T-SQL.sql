-- *******************************************************************************
-- * 																		     
-- *   Temat projektu:           Implementacja RDB na SZBD MS SQL SERVER                                                   
-- * 																		     
-- *******************************************************************************

-- -------------------------------------------------------------------------------
-- TWORZENIE STRUKTURY BAZY DANYCH                                          
-- -------------------------------------------------------------------------------

CREATE TABLE ksiazka (
    id_ksiazka                   INT NOT NULL PRIMARY KEY,
    tytul                        VARCHAR(50) NOT NULL,
    autor_id_autor               INT NOT NULL,
    lokalizacja_id_lokalizacja   INT NOT NULL,
);

CREATE TABLE autor (
    id_autor  INT NOT NULL PRIMARY KEY,
    imie      VARCHAR(50) NOT NULL,
    nazwisko  VARCHAR(50) NOT NULL
);

CREATE TABLE czytelnik (
    id_czytelnik    INT NOT NULL PRIMARY KEY,
    imie            VARCHAR(50) NOT NULL,
    nazwisko        VARCHAR(50) NOT NULL,
    numer_telefonu  VARCHAR(50) NOT NULL,
    adres           VARCHAR(100)
);

CREATE TABLE gatunek (
    id_gatunek     INT NOT NULL PRIMARY KEY,
    id_ksiazka     INT NOT NULL,
    nazwa_gatunku  VARCHAR(50) NOT NULL
);
CREATE TABLE lokalizacja (
    id_lokalizacja  INT NOT NULL PRIMARY KEY,
    id_ksiazka      INT NOT NULL,
    dzial           INT NOT NULL,
    regal           INT NOT NULL,
    polka           INT NOT NULL
);

CREATE TABLE ocena (
    id_ocena            INT NOT NULL PRIMARY KEY,
    wartosc             INT NOT NULL,
    ksiazka_id_ksiazka  INT NOT NULL
);

CREATE TABLE r_ksiazka_gatunek (
    ksiazka_id_ksiazka  INT NOT NULL PRIMARY KEY,
    gatunek_id_gatunek  INT NOT NULL
);

CREATE TABLE rezerwacja (
    id_rezerwacja           INT NOT NULL PRIMARY KEY,
    data_rezerwacji         DATE NOT NULL,
    czytelnik_id_czytelnik  INT NOT NULL,
    ksiazka_id_ksiazka      INT NOT NULL
);

CREATE TABLE wypozyczenie (
    id_wypozyczenie         INT NOT NULL PRIMARY KEY,
    data_wypozyczenia       DATE NOT NULL,
    data_zwrotu             DATE,
    czytelnik_id_czytelnik  INT NOT NULL,
    ksiazka_id_ksiazka      INT NOT NULL
);

ALTER TABLE ksiazka
ADD FOREIGN KEY (autor_id_autor) REFERENCES autor(id_autor);

ALTER TABLE ksiazka
ADD FOREIGN KEY (lokalizacja_id_lokalizacja) REFERENCES lokalizacja(id_lokalizacja);

ALTER TABLE ocena
ADD FOREIGN KEY (ksiazka_id_ksiazka) REFERENCES ksiazka(id_ksiazka);

ALTER TABLE r_ksiazka_gatunek
    ADD FOREIGN KEY (gatunek_id_gatunek) REFERENCES gatunek(id_gatunek);

ALTER TABLE r_ksiazka_gatunek
    ADD FOREIGN KEY(ksiazka_id_ksiazka) REFERENCES ksiazka(id_ksiazka);

ALTER TABLE rezerwacja
ADD FOREIGN KEY (czytelnik_id_czytelnik) REFERENCES czytelnik(id_czytelnik);

ALTER TABLE rezerwacja
ADD FOREIGN KEY (ksiazka_id_ksiazka) REFERENCES ksiazka(id_ksiazka);

ALTER TABLE wypozyczenie
ADD FOREIGN KEY (czytelnik_id_czytelnik) REFERENCES czytelnik(id_czytelnik);

ALTER TABLE wypozyczenie
ADD FOREIGN KEY (ksiazka_id_ksiazka) REFERENCES ksiazka(id_ksiazka);

-- -------------------------------------------------------------------------------
-- POLECENIA:   5 X INSERT  DO WSZYSTKICH TABEL                                              
-- -------------------------------------------------------------------------------

-- AUTOR
INSERT into autor (id_autor, imie, nazwisko) VALUES ('1', 'Adam', 'Mickiewicz');
INSERT into autor (id_autor, imie, nazwisko) VALUES ('2', 'Jojo', 'Moyes');
INSERT into autor (id_autor, imie, nazwisko) VALUES ('3', 'George', 'Orwell');
INSERT into autor (id_autor, imie, nazwisko) VALUES ('4', 'Jane', 'Austen');
INSERT into autor (id_autor, imie, nazwisko) VALUES ('5', 'Emily', 'Bronte');

-- LOKALIZACJA

INSERT into lokalizacja (id_lokalizacja, id_ksiazka, dzial, regal, polka) VALUES ('110', '1', '1', '1', '1');
INSERT into lokalizacja (id_lokalizacja, id_ksiazka, dzial, regal, polka) VALUES ('120', '2', '1', '1', '1');
INSERT into lokalizacja (id_lokalizacja, id_ksiazka, dzial, regal, polka) VALUES ('130', '3', '1', '1', '1');
INSERT into lokalizacja (id_lokalizacja, id_ksiazka, dzial, regal, polka) VALUES ('140', '4', '1', '1', '1');
INSERT into lokalizacja (id_lokalizacja, id_ksiazka, dzial, regal, polka) VALUES ('150', '5', '1', '1', '1');

-- KSIAZKA

INSERT into ksiazka (id_ksiazka, tytul, autor_id_autor, lokalizacja_id_lokalizacja) VALUES ('1', 'Pan Tadeusz', '1', '110');
INSERT into ksiazka (id_ksiazka, tytul, autor_id_autor, lokalizacja_id_lokalizacja) VALUES ('2', 'Zanim sie pojawiles', '2', '120');
INSERT into ksiazka (id_ksiazka, tytul, autor_id_autor, lokalizacja_id_lokalizacja) VALUES ('3', 'Rok 1984', '3', '130');
INSERT into ksiazka (id_ksiazka, tytul, autor_id_autor, lokalizacja_id_lokalizacja) VALUES ('4', 'Duma i uprzedzenie', '4', '140');
INSERT into ksiazka (id_ksiazka, tytul, autor_id_autor, lokalizacja_id_lokalizacja) VALUES ('5', 'Wichrowe wzgorza', '5', '150');

-- GATUNEK

INSERT into gatunek (id_gatunek, id_ksiazka, nazwa_gatunku) VALUES ('1', '1', 'Literatura klasyczna');
INSERT into gatunek (id_gatunek, id_ksiazka, nazwa_gatunku) VALUES ('2', '2', 'Romans');
INSERT into gatunek (id_gatunek, id_ksiazka, nazwa_gatunku) VALUES ('3', '3', 'Fantastyka');
INSERT into gatunek (id_gatunek, id_ksiazka, nazwa_gatunku) VALUES ('4', '4', 'Literatura klasyczna');
INSERT into gatunek (id_gatunek, id_ksiazka, nazwa_gatunku) VALUES ('5', '5', 'Literatura klasyczna');

-- OCENA

INSERT into ocena (id_ocena, wartosc, ksiazka_id_ksiazka) VALUES ('1', '5', '1');
INSERT into ocena (id_ocena, wartosc, ksiazka_id_ksiazka) VALUES ('2', '5', '2');
INSERT into ocena (id_ocena, wartosc, ksiazka_id_ksiazka) VALUES ('3', '6', '3');
INSERT into ocena (id_ocena, wartosc, ksiazka_id_ksiazka) VALUES ('4', '0', '4');
INSERT into ocena (id_ocena, wartosc, ksiazka_id_ksiazka) VALUES ('5', '5', '5');

-- CZYTELNIK

INSERT into czytelnik (id_czytelnik, imie, nazwisko, numer_telefonu, adres) VALUES ('1', 'Pawel', 'Pyszny', '333333333', 'Wroclaw Klonowa 2');
INSERT into czytelnik (id_czytelnik, imie, nazwisko, numer_telefonu, adres) VALUES ('2', 'Jan', 'Kowalski', '123433333', 'Warszawa Klonowa 2');
INSERT into czytelnik (id_czytelnik, imie, nazwisko, numer_telefonu, adres) VALUES ('3', 'Carmen', 'Czartoryska', '678933333', 'Opole Klonowa 2');
INSERT into czytelnik (id_czytelnik, imie, nazwisko, numer_telefonu, adres) VALUES ('4', 'Bartosz', 'Nowak', '333331234', 'Krakow Klonowa 2');
INSERT into czytelnik (id_czytelnik, imie, nazwisko, numer_telefonu, adres) VALUES ('5', 'Jakub', 'Suchy', '333777777', 'Katowice Klonowa 2');

-- REZERWACJA

INSERT into rezerwacja (id_rezerwacja, data_rezerwacji, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('1', '01/01/13', '1', '1');
INSERT into rezerwacja (id_rezerwacja, data_rezerwacji, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('2', '02/02/13', '2', '2');
INSERT into rezerwacja (id_rezerwacja, data_rezerwacji, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('3', '01/03/16', '3', '3');
INSERT into rezerwacja (id_rezerwacja, data_rezerwacji, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('4', '01/04/13', '4', '4');
INSERT into rezerwacja (id_rezerwacja, data_rezerwacji, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('5', '01/05/18', '5', '5');

-- WYPOZYCZENIE

INSERT into wypozyczenie (id_wypozyczenie, data_wypozyczenia, data_zwrotu, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('1', '01/01/13', '01/01/13', '1', '1');
INSERT into wypozyczenie (id_wypozyczenie, data_wypozyczenia, data_zwrotu, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('2', '01/01/14', '01/02/13', '2', '2');
INSERT into wypozyczenie (id_wypozyczenie, data_wypozyczenia, data_zwrotu, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('3', '01/01/15', '01/02/13', '3', '3');
INSERT into wypozyczenie (id_wypozyczenie, data_wypozyczenia, data_zwrotu, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('4', '01/01/16', '01/02/13', '4', '4');
INSERT into wypozyczenie (id_wypozyczenie, data_wypozyczenia, data_zwrotu, czytelnik_id_czytelnik, ksiazka_id_ksiazka) VALUES ('5', '01/01/17', '01/02/13', '5', '5');

-- -------------------------------------------------------------------------------
-- POLECENIA:   10 X SELECT                                                     
-- -------------------------------------------------------------------------------


-- 1
SELECT tytul, imie, nazwisko, polka
	FROM ksiazka 
		JOIN autor 
		ON autor_id_autor=id_autor
		JOIN lokalizacja
		ON lokalizacja_id_lokalizacja=id_lokalizacja
		GROUP BY polka, tytul, imie, nazwisko 
		ORDER BY tytul;

-- 2
SELECT tytul, imie, nazwisko, data_wypozyczenia, data_zwrotu 
	FROM ksiazka 
		JOIN autor
		ON autor_id_autor=id_autor
		JOIN wypozyczenie
		ON ksiazka_id_ksiazka=(select id_ksiazka from ksiazka where tytul like 'Pan Tadeusz') 
		ORDER BY imie;

-- 3
SELECT UPPER(tytul) AS tytul 
	FROM ksiazka 
	WHERE autor_id_autor=(SELECT id_autor FROM autor WHERE imie like 'Adam'); 

-- 4
SELECT wartosc, tytul, imie, nazwisko 
	FROM ocena 
	JOIN ksiazka
	ON ksiazka_id_ksiazka=id_ksiazka
	JOIN autor
	ON autor_id_autor=id_autor
	ORDER BY wartosc;

-- 5
SELECT tytul, imie, nazwisko, data_rezerwacji 
	FROM rezerwacja 
	JOIN ksiazka
	ON ksiazka_id_ksiazka=id_ksiazka
	JOIN autor
	ON id_autor=autor_id_autor
	ORDER BY tytul;

-- 6
SELECT tytul, imie, nazwisko, data_wypozyczenia 
	FROM wypozyczenie
	JOIN ksiazka
	ON ksiazka_id_ksiazka=id_ksiazka
	JOIN autor
	ON id_autor=autor_id_autor
	ORDER BY tytul;

-- 7
SELECT tytul, data_rezerwacji, data_wypozyczenia 
	FROM wypozyczenie w
	JOIN ksiazka
	ON w.ksiazka_id_ksiazka=id_ksiazka
	JOIN rezerwacja r
	ON r.ksiazka_id_ksiazka=id_ksiazka
	ORDER BY tytul;

-- 8
SELECT tytul, data_wypozyczenia, data_zwrotu, nazwisko 
	FROM wypozyczenie
	JOIN ksiazka
	ON ksiazka_id_ksiazka=id_ksiazka
	JOIN czytelnik
	ON id_czytelnik=czytelnik_id_czytelnik
	ORDER BY tytul;

-- 9
SELECT tytul, imie, nazwisko, dzial, regal, polka 
	FROM autor
	JOIN ksiazka
	ON id_autor=autor_id_autor
	JOIN lokalizacja
	ON id_lokalizacja=lokalizacja_id_lokalizacja
	ORDER BY tytul;

-- 10
SELECT tytul, nazwa_gatunku, dzial, regal, polka 
	FROM gatunek g
	JOIN ksiazka k
	ON g.id_ksiazka=k.id_ksiazka
	JOIN lokalizacja l
	ON l.id_lokalizacja=k.lokalizacja_id_lokalizacja
	ORDER BY tytul;

-- -------------------------------------------------------------------------------
-- POLECENIA:   5 X UPDATE                                         
-- -------------------------------------------------------------------------------

-- 1
UPDATE autor SET imie=UPPER(imie) WHERE id_autor=(SELECT autor_id_autor FROM ksiazka where tytul like 'Zanim sie pojawiles');

-- 2
UPDATE wypozyczenie SET czytelnik_id_czytelnik=5 WHERE ksiazka_id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE tytul like 'Pan Tadeusz');

-- 3
UPDATE czytelnik SET numer_telefonu='123456789' WHERE id_czytelnik=(SELECT czytelnik_id_czytelnik FROM rezerwacja WHERE id_rezerwacja=5);

-- 4
UPDATE lokalizacja SET regal=5 WHERE id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE tytul like 'Duma i uprzedzenie');

-- 5
UPDATE gatunek SET nazwa_gatunku='Epos' WHERE id_ksiazka=(SELECT id_ksiazka from ksiazka where lokalizacja_id_lokalizacja like 110);

-- -------------------------------------------------------------------------------
-- POLECENIA:   5 X DELETE     (TEŻ Z PODZAPYTANIAMI itp)                                    
-- -------------------------------------------------------------------------------

-- 1
DELETE FROM ocena WHERE ksiazka_id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE tytul like 'Zanim sie pojawiles');

-- 2
DELETE FROM wypozyczenie WHERE ksiazka_id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE tytul like 'Wichrowe wzgorza');

--3
DELETE FROM rezerwacja WHERE czytelnik_id_czytelnik=(SELECT id_czytelnik FROM czytelnik WHERE imie like 'Carmen');

-- 4
DELETE FROM gatunek WHERE id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE autor_id_autor like 3);

-- 5
DELETE FROM ocena WHERE ksiazka_id_ksiazka=(SELECT ksiazka_id_ksiazka FROM wypozyczenie WHERE czytelnik_id_czytelnik like 3);

-- -------------------------------------------------------------------------------
-- USUWANIE STRUKTURY BAZY DANYCH                                           
-- -------------------------------------------------------------------------------

ALTER TABLE ksiazka
DROP CONSTRAINT FK__ksiazka__autor_i__45F365D3;

ALTER TABLE ksiazka
DROP CONSTRAINT FK__ksiazka__lokaliz__46E78A0C;

ALTER TABLE ocena
DROP CONSTRAINT FK__ocena__ksiazka_i__47DBAE45;

ALTER TABLE r_ksiazka_gatunek
DROP CONSTRAINT FK__r_ksiazka__gatun__48CFD27E;

ALTER TABLE r_ksiazka_gatunek
DROP CONSTRAINT FK__r_ksiazka__ksiaz__49C3F6B7;

ALTER TABLE rezerwacja
DROP CONSTRAINT FK__rezerwacj__czyte__4AB81AF0;

ALTER TABLE rezerwacja
DROP CONSTRAINT FK__rezerwacj__ksiaz__4BAC3F29;

ALTER TABLE wypozyczenie
DROP CONSTRAINT FK__wypozycze__czyte__4CA06362;

ALTER TABLE wypozyczenie
DROP CONSTRAINT FK__wypozycze__ksiaz__4D94879B;

DROP TABLE autor;
DROP TABLE wypozyczenie;
DROP TABLE rezerwacja;
DROP TABLE ocena;
DROP TABLE lokalizacja;
DROP TABLE czytelnik;
DROP TABLE gatunek;
DROP TABLE ksiazka;
DROP TABLE r_ksiazka_gatunek;
