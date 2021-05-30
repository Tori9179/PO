-- *******************************************************************************
-- * 																		     
-- *   Temat projektu:        Implementacja RDB na SZBD ORACLE                                                       
-- * 																		     
-- *******************************************************************************


-- -------------------------------------------------------------------------------
-- TWORZENIE STRUKTURY BAZY DANYCH                                           
-- -------------------------------------------------------------------------------

CREATE TABLE autor (
    id_autor  NUMBER NOT NULL,
    imie      VARCHAR2(50) NOT NULL,
    nazwisko  VARCHAR2(50) NOT NULL
);

ALTER TABLE autor ADD CONSTRAINT autor_pk PRIMARY KEY ( id_autor );

CREATE TABLE czytelnik (
    id_czytelnik    NUMBER NOT NULL,
    imie            VARCHAR2(50) NOT NULL,
    nazwisko        VARCHAR2(50) NOT NULL,
    numer_telefonu  VARCHAR2(50) NOT NULL,
    adres           VARCHAR2(100)
);

ALTER TABLE czytelnik ADD CONSTRAINT czytelnik_pk PRIMARY KEY ( id_czytelnik );

CREATE TABLE gatunek (
    id_gatunek     NUMBER NOT NULL,
    id_ksiazka     NUMBER NOT NULL,
    nazwa_gatunku  VARCHAR2(50) NOT NULL
);

ALTER TABLE gatunek ADD CONSTRAINT gatunek_pk PRIMARY KEY ( id_gatunek );

CREATE TABLE ksiazka (
    id_ksiazka                   NUMBER NOT NULL,
    tytul                        VARCHAR2(50) NOT NULL,
    autor_id_autor               NUMBER NOT NULL,
    lokalizacja_id_lokalizacja   NUMBER NOT NULL,
    lokalizacja_id_lokalizacja2  NUMBER NOT NULL
);

ALTER TABLE ksiazka ADD CONSTRAINT ksiazka_pk PRIMARY KEY ( id_ksiazka );

CREATE TABLE lokalizacja (
    id_lokalizacja  NUMBER NOT NULL,
    id_ksiazka      NUMBER NOT NULL,
    dzial           NUMBER NOT NULL,
    regal           NUMBER NOT NULL,
    polka           NUMBER NOT NULL
);

ALTER TABLE lokalizacja ADD CONSTRAINT lokalizacja_pk PRIMARY KEY ( id_lokalizacja );

CREATE TABLE ocena (
    id_ocena            NUMBER NOT NULL,
    wartosc             NUMBER NOT NULL,
    ksiazka_id_ksiazka  NUMBER NOT NULL
);

ALTER TABLE ocena ADD CONSTRAINT ocena_pk PRIMARY KEY ( id_ocena );

CREATE TABLE r_ksiazka_gatunek (
    ksiazka_id_ksiazka  NUMBER NOT NULL,
    gatunek_id_gatunek  NUMBER NOT NULL
);

ALTER TABLE r_ksiazka_gatunek ADD CONSTRAINT r_ksiazka_gatunek_pk PRIMARY KEY ( ksiazka_id_ksiazka,
                                                                                gatunek_id_gatunek );

CREATE TABLE rezerwacja (
    id_rezerwacja           NUMBER NOT NULL,
    data_rezerwacji         DATE NOT NULL,
    czytelnik_id_czytelnik  NUMBER NOT NULL,
    ksiazka_id_ksiazka      NUMBER NOT NULL
);

ALTER TABLE rezerwacja ADD CONSTRAINT rezerwacja_pk PRIMARY KEY ( id_rezerwacja );

CREATE TABLE wypozyczenie (
    id_wypozyczenie         NUMBER NOT NULL,
    data_wypozyczenia       DATE NOT NULL,
    data_zwrotu             DATE,
    czytelnik_id_czytelnik  NUMBER NOT NULL,
    ksiazka_id_ksiazka      NUMBER NOT NULL
);

ALTER TABLE wypozyczenie ADD CONSTRAINT wypozyczenie_pk PRIMARY KEY ( id_wypozyczenie );

ALTER TABLE ksiazka
    ADD CONSTRAINT ksiazka_autor_fk FOREIGN KEY ( autor_id_autor )
        REFERENCES autor ( id_autor );

ALTER TABLE ksiazka
    ADD CONSTRAINT ksiazka_lokalizacja_fk FOREIGN KEY ( lokalizacja_id_lokalizacja )
        REFERENCES lokalizacja ( id_lokalizacja );

ALTER TABLE ocena
    ADD CONSTRAINT ocena_ksiazka_fk FOREIGN KEY ( ksiazka_id_ksiazka )
        REFERENCES ksiazka ( id_ksiazka );

ALTER TABLE r_ksiazka_gatunek
    ADD CONSTRAINT r_ksiazka_gatunek_gatunek_fk FOREIGN KEY ( gatunek_id_gatunek )
        REFERENCES gatunek ( id_gatunek );

ALTER TABLE r_ksiazka_gatunek
    ADD CONSTRAINT r_ksiazka_gatunek_ksiazka_fk FOREIGN KEY ( ksiazka_id_ksiazka )
        REFERENCES ksiazka ( id_ksiazka );

ALTER TABLE rezerwacja
    ADD CONSTRAINT rezerwacja_czytelnik_fk FOREIGN KEY ( czytelnik_id_czytelnik )
        REFERENCES czytelnik ( id_czytelnik );

ALTER TABLE rezerwacja
    ADD CONSTRAINT rezerwacja_ksiazka_fk FOREIGN KEY ( ksiazka_id_ksiazka )
        REFERENCES ksiazka ( id_ksiazka );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_czytelnik_fk FOREIGN KEY ( czytelnik_id_czytelnik )
        REFERENCES czytelnik ( id_czytelnik );

ALTER TABLE wypozyczenie
    ADD CONSTRAINT wypozyczenie_ksiazka_fk FOREIGN KEY ( ksiazka_id_ksiazka )
        REFERENCES ksiazka ( id_ksiazka );

-- -------------------------------------------------------------------------------
-- POLECENIA:   5 X INSERT  DO WSZYSTKICH TABEL                                             
-- -------------------------------------------------------------------------------

-- AUTOR
INSERT into AUTOR (ID_AUTOR, IMIE, NAZWISKO) VALUES ('1', 'Adam', 'Mickiewicz');
INSERT into AUTOR (ID_AUTOR, IMIE, NAZWISKO) VALUES ('2', 'Jojo', 'Moyes');
INSERT into AUTOR (ID_AUTOR, IMIE, NAZWISKO) VALUES ('3', 'George', 'Orwell');
INSERT into AUTOR (ID_AUTOR, IMIE, NAZWISKO) VALUES ('4', 'Jane', 'Austen');
INSERT into AUTOR (ID_AUTOR, IMIE, NAZWISKO) VALUES ('5', 'Emily', 'Bronte');

-- LOKALIZACJA

INSERT into LOKALIZACJA (ID_LOKALIZACJA, ID_KSIAZKA, DZIAL, REGAL, POLKA) VALUES ('110', '1', '1', '1', '1');
INSERT into LOKALIZACJA (ID_LOKALIZACJA, ID_KSIAZKA, DZIAL, REGAL, POLKA) VALUES ('120', '2', '1', '1', '1');
INSERT into LOKALIZACJA (ID_LOKALIZACJA, ID_KSIAZKA, DZIAL, REGAL, POLKA) VALUES ('130', '3', '1', '1', '1');
INSERT into LOKALIZACJA (ID_LOKALIZACJA, ID_KSIAZKA, DZIAL, REGAL, POLKA) VALUES ('140', '4', '1', '1', '1');
INSERT into LOKALIZACJA (ID_LOKALIZACJA, ID_KSIAZKA, DZIAL, REGAL, POLKA) VALUES ('150', '5', '1', '1', '1');

-- KSIAZKA

INSERT into KSIAZKA (ID_KSIAZKA, TYTUL, AUTOR_ID_AUTOR, LOKALIZACJA_ID_LOKALIZACJA2, LOKALIZACJA_ID_LOKALIZACJA) VALUES ('1', 'Pan Tadeusz', '1', '110', '110');
INSERT into KSIAZKA (ID_KSIAZKA, TYTUL, AUTOR_ID_AUTOR, LOKALIZACJA_ID_LOKALIZACJA2, LOKALIZACJA_ID_LOKALIZACJA) VALUES ('2', 'Zanim sie pojawiles', '2', '120', '120');
INSERT into KSIAZKA (ID_KSIAZKA, TYTUL, AUTOR_ID_AUTOR, LOKALIZACJA_ID_LOKALIZACJA2, LOKALIZACJA_ID_LOKALIZACJA) VALUES ('3', 'Rok 1984', '3', '130', '130');
INSERT into KSIAZKA (ID_KSIAZKA, TYTUL, AUTOR_ID_AUTOR, LOKALIZACJA_ID_LOKALIZACJA2, LOKALIZACJA_ID_LOKALIZACJA) VALUES ('4', 'Duma i uprzedzenie', '4', '140', '140');
INSERT into KSIAZKA (ID_KSIAZKA, TYTUL, AUTOR_ID_AUTOR, LOKALIZACJA_ID_LOKALIZACJA2, LOKALIZACJA_ID_LOKALIZACJA) VALUES ('5', 'Wichrowe wzgorza', '5', '150', '150');

-- GATUNEK

INSERT into GATUNEK (ID_GATUNEK, ID_KSIAZKA, NAZWA_GATUNKU) VALUES ('1', '1', 'Literatura klasyczna');
INSERT into GATUNEK (ID_GATUNEK, ID_KSIAZKA, NAZWA_GATUNKU) VALUES ('2', '2', 'Romans');
INSERT into GATUNEK (ID_GATUNEK, ID_KSIAZKA, NAZWA_GATUNKU) VALUES ('3', '3', 'Fantastyka');
INSERT into GATUNEK (ID_GATUNEK, ID_KSIAZKA, NAZWA_GATUNKU) VALUES ('4', '4', 'Literatura klasyczna');
INSERT into GATUNEK (ID_GATUNEK, ID_KSIAZKA, NAZWA_GATUNKU) VALUES ('5', '5', 'Literatura klasyczna');

-- OCENA

INSERT into OCENA (ID_OCENA, WARTOSC, KSIAZKA_ID_KSIAZKA) VALUES ('1', '5', '1');
INSERT into OCENA (ID_OCENA, WARTOSC, KSIAZKA_ID_KSIAZKA) VALUES ('2', '5', '2');
INSERT into OCENA (ID_OCENA, WARTOSC, KSIAZKA_ID_KSIAZKA) VALUES ('3', '6', '3');
INSERT into OCENA (ID_OCENA, WARTOSC, KSIAZKA_ID_KSIAZKA) VALUES ('4', '0', '4');
INSERT into OCENA (ID_OCENA, WARTOSC, KSIAZKA_ID_KSIAZKA) VALUES ('5', '5', '5');

-- CZYTELNIK

INSERT into CZYTELNIK (ID_CZYTELNIK, IMIE, NAZWISKO, NUMER_TELEFONU, ADRES) VALUES ('1', 'Pawel', 'Pyszny', '333333333', 'Wroclaw Klonowa 2');
INSERT into CZYTELNIK (ID_CZYTELNIK, IMIE, NAZWISKO, NUMER_TELEFONU, ADRES) VALUES ('2', 'Jan', 'Kowalski', '123433333', 'Warszawa Klonowa 2');
INSERT into CZYTELNIK (ID_CZYTELNIK, IMIE, NAZWISKO, NUMER_TELEFONU, ADRES) VALUES ('3', 'Carmen', 'Czartoryska', '678933333', 'Opole Klonowa 2');
INSERT into CZYTELNIK (ID_CZYTELNIK, IMIE, NAZWISKO, NUMER_TELEFONU, ADRES) VALUES ('4', 'Bartosz', 'Nowak', '333331234', 'Krakow Klonowa 2');
INSERT into CZYTELNIK (ID_CZYTELNIK, IMIE, NAZWISKO, NUMER_TELEFONU, ADRES) VALUES ('5', 'Jakub', 'Suchy', '333777777', 'Katowice Klonowa 2');

-- REZERWACJA

INSERT into REZERWACJA (ID_REZERWACJA, DATA_REZERWACJI, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('1', to_date('01/01/13','RR/MM/DD'), '1', '1');
INSERT into REZERWACJA (ID_REZERWACJA, DATA_REZERWACJI, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('2', to_date('02/02/13','RR/MM/DD'), '2', '2');
INSERT into REZERWACJA (ID_REZERWACJA, DATA_REZERWACJI, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('3', to_date('01/03/16','RR/MM/DD'), '3', '3');
INSERT into REZERWACJA (ID_REZERWACJA, DATA_REZERWACJI, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('4', to_date('01/04/13','RR/MM/DD'), '4', '4');
INSERT into REZERWACJA (ID_REZERWACJA, DATA_REZERWACJI, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('5', to_date('01/05/18','RR/MM/DD'), '5', '5');

-- WYPOZYCZENIE

INSERT into WYPOZYCZENIE (ID_WYPOZYCZENIE, DATA_WYPOZYCZENIA, DATA_ZWROTU, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('1', to_date('01/01/13','RR/MM/DD'), to_date('01/01/13','RR/MM/DD'), '1', '1');
INSERT into WYPOZYCZENIE (ID_WYPOZYCZENIE, DATA_WYPOZYCZENIA, DATA_ZWROTU, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('2', to_date('01/01/14','RR/MM/DD'), to_date('01/02/13','RR/MM/DD'), '2', '2');
INSERT into WYPOZYCZENIE (ID_WYPOZYCZENIE, DATA_WYPOZYCZENIA, DATA_ZWROTU, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('3', to_date('01/01/15','RR/MM/DD'), to_date('01/02/13','RR/MM/DD'), '3', '3');
INSERT into WYPOZYCZENIE (ID_WYPOZYCZENIE, DATA_WYPOZYCZENIA, DATA_ZWROTU, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('4', to_date('01/01/16','RR/MM/DD'), to_date('01/02/13','RR/MM/DD'), '4', '4');
INSERT into WYPOZYCZENIE (ID_WYPOZYCZENIE, DATA_WYPOZYCZENIA, DATA_ZWROTU, CZYTELNIK_ID_CZYTELNIK, KSIAZKA_ID_KSIAZKA) VALUES ('5', to_date('01/01/17','RR/MM/DD'), to_date('01/02/13','RR/MM/DD'), '5', '5');
-- -------------------------------------------------------------------------------
-- POLECENIA:   10 X SELECT  
-- -------------------------------------------------------------------------------
-- nowy 
SELECT tytul, imie, nazwisko, polka FROM ksiazka NATURAL JOIN autor NATURAL JOIN lokalizacja 
WHERE AUTOR_ID_AUTOR=id_autor And LOKALIZACJA_ID_LOKALIZACJA2=id_lokalizacja GROUP BY polka, tytul, imie, nazwisko ORDER BY tytul;

-- nowy
select tytul, imie, nazwisko, data_wypozyczenia, data_zwrotu from ksiazka natural join autor natural join wypozyczenie
where AUTOR_ID_AUTOR=id_autor and ksiazka_id_ksiazka=(select id_ksiazka from ksiazka where tytul like 'Pan Tadeusz') order by imie;

-- nowy
SELECT UPPER(tytul) from ksiazka where autor_id_autor=(select id_autor from autor where imie like 'Adam'); 

-- 1
SELECT o.wartosc, k.TYTUL, a.imie, a.nazwisko from AUTOR a, OCENA o, KSIAZKA k WHERE ((o.KSIAZKA_ID_KSIAZKA=k.ID_KSIAZKA)And(k.AUTOR_ID_AUTOR=a.id_autor)) ORDER BY o.wartosc;

-- 2
SELECT k.TYTUL, a.imie, a.nazwisko, r.data_rezerwacji from AUTOR a, KSIAZKA k, REZERWACJA r WHERE (r.ksiazka_id_ksiazka=k.id_ksiazka) AND (a.id_autor=k.autor_id_autor) ORDER BY k.tytul;

-- 3
SELECT k.TYTUL, a.imie, a.nazwisko, w.data_wypozyczenia from AUTOR a, KSIAZKA k, WYPOZYCZENIE w WHERE (w.ksiazka_id_ksiazka=k.id_ksiazka) AND (a.id_autor=k.autor_id_autor) ORDER BY k.tytul;

-- 4
SELECT k.TYTUL, r.data_rezerwacji, w.data_wypozyczenia from KSIAZKA k, WYPOZYCZENIE w, REZERWACJA r WHERE (w.ksiazka_id_ksiazka=k.id_ksiazka) AND (r.ksiazka_id_ksiazka=k.id_ksiazka) ORDER BY k.tytul;

-- 5
SELECT k.TYTUL, w.data_wypozyczenia, w.data_zwrotu, c.nazwisko from KSIAZKA k, WYPOZYCZENIE w, CZYTELNIK c WHERE (w.ksiazka_id_ksiazka=k.id_ksiazka) AND (c.id_czytelnik=w.CZYTELNIK_ID_CZYTELNIK) ORDER BY k.tytul;

-- 6
SELECT k.tytul, a.imie, a.nazwisko, l.dzial, l.regal, l.polka from KSIAZKA k, LOKALIZACJA l, AUTOR a WHERE (a.id_autor=k.autor_id_autor) AND (l.id_lokalizacja=k.lokalizacja_id_lokalizacja) ORDER BY k.tytul;

-- 7
SELECT k.tytul, g.nazwa_gatunku, l.dzial, l.regal, l.polka from KSIAZKA k, LOKALIZACJA l, GATUNEK g WHERE (g.id_ksiazka=k.id_ksiazka) AND (l.id_lokalizacja=k.lokalizacja_id_lokalizacja) ORDER BY k.tytul;

-- 8
SELECT k.tytul, g.nazwa_gatunku, o.wartosc from KSIAZKA k, OCENA o, GATUNEK g WHERE ((g.id_ksiazka=k.id_ksiazka) AND (o.ksiazka_id_ksiazka=k.id_ksiazka) AND o.wartosc='5') ORDER BY k.tytul;

-- 9
SELECT k.tytul, g.nazwa_gatunku, o.wartosc from KSIAZKA k, OCENA o, GATUNEK g WHERE ((g.id_ksiazka=k.id_ksiazka) AND (o.ksiazka_id_ksiazka=k.id_ksiazka) AND g.nazwa_gatunku='Literatura klasyczna') ORDER BY k.tytul;

-- 10
SELECT k.tytul, g.nazwa_gatunku, o.wartosc, a.nazwisko from KSIAZKA k, OCENA o, GATUNEK g, AUTOR a WHERE (((g.id_ksiazka=k.id_ksiazka) AND (o.ksiazka_id_ksiazka=k.id_ksiazka) AND a.nazwisko='Mickiewicz') AND a.id_autor=k.autor_id_autor) ORDER BY k.tytul;

-- -------------------------------------------------------------------------------
-- POLECENIA:   5 X UPDATE                                                
-- -------------------------------------------------------------------------------

-- nowy
UPDATE autor SET imie=UPPER(imie) WHERE id_autor=(SELECT autor_id_autor FROM ksiazka where tytul like 'Zanim sie pojawiles');

-- 1
UPDATE ocena SET wartosc=3 WHERE ksiazka_id_ksiazka=(SELECT id_ksiazka FROM ksiazka where tytul like 'Pan Tadeusz');

-- 2
UPDATE wypozyczenie SET czytelnik_id_czytelnik=5 WHERE ksiazka_id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE tytul like 'Pan Tadeusz');

-- 3
UPDATE czytelnik SET numer_telefonu='123456789' WHERE id_czytelnik=(SELECT czytelnik_id_czytelnik FROM rezerwacja WHERE id_rezerwacja=5);

-- 4
UPDATE lokalizacja SET regal=5 WHERE id_ksiazka=(SELECT id_ksiazka FROM ksiazka WHERE tytul like 'Duma i uprzedzenie');

-- 5
UPDATE gatunek SET nazwa_gatunku='Epos' WHERE id_ksiazka=(SELECT id_ksiazka from ksiazka where lokalizacja_id_lokalizacja like 110);

-- -------------------------------------------------------------------------------
-- POLECENIA:   5 X DELETE                                        
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
DELETE FROM ocena WHERE ksiazka_id_ksiazka=(SELECT ksiazka_id_ksiazka FROM wypozyczenie WHERE data_wypozyczenia like '01/01/17');

-- -------------------------------------------------------------------------------
-- USUWANIE STRUKTURY BAZY DANYCH                                          
-- -------------------------------------------------------------------------------

DROP TABLE autor CASCADE CONSTRAINTS;
DROP TABLE wypozyczenie CASCADE CONSTRAINTS;
DROP TABLE rezerwacja CASCADE CONSTRAINTS;
DROP TABLE ocena CASCADE CONSTRAINTS;
DROP TABLE lokalizacja CASCADE CONSTRAINTS;
DROP TABLE czytelnik CASCADE CONSTRAINTS;
DROP TABLE gatunek CASCADE CONSTRAINTS;
DROP TABLE ksiazka CASCADE CONSTRAINTS;
