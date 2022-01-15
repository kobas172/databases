use Gabinet_Stomatologiczny

INSERT INTO Typy_Zabiegow (Nazwa_Zabiegow) VALUES
	('Wybielanie zebow'),
	('Protetyka stomatologiczna'),
	('Chirurgia stomatologiczna'),
	('Higienyzacja zebow i profilaktyka'),
	('Leczenie kanalowe'),
	('Nakladki ortodontyczne'),
	('Leczenie prochnicy'),
	('Stomatologia zachowawcza'),
	('Radiologia cyfrowa - RTG zebow'),
	('Zakladanie aparatu ortodontycznego'),
	('Przeglad stomatologiczny');

INSERT INTO Typy_Specjalizacji (Nazwa_Specjalizacji) VALUES
	('Asystent stomatologa powszechnego'),
	('Mlodszy stomatolog'),
	('Chirurg'),
	('Asystentka chirurga'),
	('Stomatolog powszechny'),
	('Stomatolog estetyczny'),
	('Stazysta'),
	('Stomatolog radiolog'),
	('Asystent radiologa'),
	('Asystent stomatologa estetycznego'),
	('Starszy stomatolog');

INSERT INTO Pacjenci VALUES
	('99112233446', 'Baltazar', 'Zylwacz', '10', '555-666-777'),
	('69112233446', 'Soltys', 'Zylwacz', '40', '555-666-888'),
	('79112233446', 'Mama', 'Zylwacz', '30', '555-666-999'),
	('09112233446', 'Wiktoria', 'Zylwacz', '10', '555-666-778'),
	('19112233446', 'Wioletka', 'Zylwacz', '15', '555-666-779'),
	('29112233446', 'Maras', 'Mauras', '16', '555-888-777'),
	('00112233446', 'Przemas', 'Michal', '99', '555-444-777'),
	('88112233446', 'Natalia', 'Strojek', '3', '555-111-777'),
	('77112233446', 'Damian', 'Strojek', '33', '555-333-777'),
	('66112233446', 'Mikolaj', 'Nowak', '17', '555-222-777'),
	('33112233446', 'Kamcia', 'Nowak', '18', '123-666-777');

INSERT INTO Zespol_Zabiegowy VALUES
	('ZZ001', NULL),
	('ZZ002', NULL),
	('ZZ003', NULL),
	('ZZ004', NULL),
	('ZZ005', NULL);

INSERT INTO Pracownicy VALUES
	('Cristiano', 'Ronaldo', '111-222-333', 'Mlodszy stomatolog', 'ZZ005'),
	('Kobe', 'Bryant', '112-222-333', 'Chirurg', 'ZZ001'),
	('Carmelo', 'Anthony', '113-222-333', 'Asystentka chirurga', 'ZZ001'),
	('Super', 'Dentystak', '114-222-333', 'Asystent radiologa', 'ZZ002'),
	('Jaro', 'Pasha', '115-222-333', 'Asystent stomatologa estetycznego', 'ZZ004'),
	('Siema', 'Nara', '116-222-333', 'Starszy stomatolog', 'ZZ005'),
	('Cotam', 'Slychac', '117-222-333', 'Asystent stomatologa powszechnego', 'ZZ003'),
	('Imieniarz', 'Nazwiskowy', '118-222-333', 'Stomatolog estetyczny', 'ZZ004'),
	('Wariacik', 'Stomatolog', '119-222-333', 'Stomatolog powszechny', 'ZZ003'),
	('Twoj', 'Dentysta', '110-222-333', 'Stomatolog radiolog', 'ZZ002'),
	('Domin', 'Zmuda', '100-222-333', 'Stazysta', 'ZZ005');

UPDATE Zespol_Zabiegowy SET Lekarz_nadzorujacy = (SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Bryant') WHERE ID_Zespolu_Zabiegowego = 'ZZ001';
UPDATE Zespol_Zabiegowy SET Lekarz_nadzorujacy = (SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Dentysta') WHERE ID_Zespolu_Zabiegowego = 'ZZ002';
UPDATE Zespol_Zabiegowy SET Lekarz_nadzorujacy = (SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Stomatolog') WHERE ID_Zespolu_Zabiegowego = 'ZZ003';
UPDATE Zespol_Zabiegowy SET Lekarz_nadzorujacy = (SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nazwiskowy') WHERE ID_Zespolu_Zabiegowego = 'ZZ004';
UPDATE Zespol_Zabiegowy SET Lekarz_nadzorujacy = (SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara') WHERE ID_Zespolu_Zabiegowego = 'ZZ005';

INSERT INTO Produkty VALUES
	('Waciki', '20.00'),
	('Chusteczki', '10.00'),
	('Woda', '30.00'),
	('Dezynfekcja', '40.50'),
	('Plomba', '50.10'),
	('Serwetki', '15.90'),
	('Patyczki', '5.00'),
	('Kubeczki', '5.00'),
	('Maseczki', '15.00'),
	('Rekawice', '20.00'),
	('Znieczulenie', '500.00'),
	('Wypelnienie', '30.00');

INSERT INTO Zabiegi VALUES ('ZZ005', '99112233446', '800.00', 'TAK', '12/12/2021', 'Przeglad stomatologiczny');
INSERT INTO Recepta VALUES ('12/12/2021', 'Ketonal przeciwbolowy', '99112233446', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '2')

INSERT INTO Zabiegi VALUES ('ZZ003', '69112233446', '400.00', 'TAK', '12/16/2021', 'Leczenie prochnicy');
INSERT INTO Recepta VALUES 	('12/16/2021', 'Ketonal przeciwbolowy', '69112233446', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '2')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Waciki'), '1')

INSERT INTO Zabiegi VALUES ('ZZ004', '79112233446', '300.50', 'NIE', '01/12/2022', 'Wybielanie zebow');
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '1')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Kubeczki'), '2')

INSERT INTO Zabiegi VALUES ('ZZ002', '09112233446', '400.50', 'NIE', '02/03/2022', 'Radiologia cyfrowa - RTG zebow');
INSERT INTO Przeswietlenia VALUES ('D:\\Zdjecia\\1.jpg', 'Super zabki pozdrawiam :)', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '1')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Maseczki'), '3')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Plomba'), '1')

INSERT INTO Zabiegi VALUES ('ZZ002', '19112233446', '400.00', 'TAK', '11/12/2021', 'Radiologia cyfrowa - RTG zebow');
INSERT INTO Przeswietlenia VALUES ('D:\\Zdjecia\\2.jpg', 'Ubytek w dolnej osemce', IDENT_CURRENT('Zabiegi'));
INSERT INTO Recepta VALUES 	('11/12/2021', 'Marsjanki', '19112233446', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '2')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Znieczulenie'), '1')

INSERT INTO Zabiegi VALUES ('ZZ005', '29112233446', '1800.50', 'TAK', '09/15/2021', 'Protetyka stomatologiczna');
INSERT INTO Recepta VALUES ('09/15/2021', 'Ketonal przeciwbolowy', '29112233446', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '2')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Plomba'), '1')

INSERT INTO Zabiegi VALUES ('ZZ005', '00112233446', '2500.00', 'NIE', '05/12/2022', 'Nakladki ortodontyczne');
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '3')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Znieczulenie'), '2')

INSERT INTO Zabiegi VALUES ('ZZ001', '88112233446', '150.00', 'TAK', '09/05/2021', 'Chirurgia stomatologiczna');
INSERT INTO Recepta VALUES ('09/05/2021', 'Masc do smarowania', '88112233446', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '2')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Waciki'), '1')

INSERT INTO Zabiegi VALUES ('ZZ001', '77112233446', '100.50', 'NIE', '01/20/2022', 'Leczenie kanalowe');
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '1')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Maseczki'), '4')

INSERT INTO Zabiegi VALUES ('ZZ005', '66112233446', '5000.00', 'TAK', '12/20/2021', 'Zakladanie aparatu ortodontycznego');
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '1')
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Woda'), '1')

INSERT INTO Zabiegi VALUES ('ZZ004', '33112233446', '600.50', 'TAK', '11/02/2021', 'Higienyzacja zebow i profilaktyka');
INSERT INTO Recepta VALUES ('11/02/2021', 'Tabletki odpornosciowe', '33112233446', IDENT_CURRENT('Zabiegi'));
INSERT INTO Zabiegi_Produkty VALUES (IDENT_CURRENT('Zabiegi'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '2')


INSERT INTO Zamowienia VALUES ('10.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara'), IDENT_CURRENT('Zamowienia'));
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Waciki'), '5');

INSERT INTO Zamowienia VALUES ('5.50');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Pasha'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Patyczki'), '2');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '5');

INSERT INTO Zamowienia VALUES ('20.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Woda'), '30');

INSERT INTO Zamowienia VALUES ('20.50');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Wypelnienie'), '3');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Maseczki'), '5');

INSERT INTO Zamowienia VALUES ('20.20');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Plomba'), '10');

INSERT INTO Zamowienia VALUES ('150.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Stomatolog'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Woda'), '150');

INSERT INTO Zamowienia VALUES ('30.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Stomatolog'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Dezynfekcja'), '3');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Znieczulenie'), '5');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Serwetki'), '8');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Wypelnienie'), '13');

INSERT INTO Zamowienia VALUES ('10.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Pasha'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Chusteczki'), '5');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Maseczki'), '5');

INSERT INTO Zamowienia VALUES ('10.50');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Stomatolog'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Waciki'), '2');

INSERT INTO Zamowienia VALUES ('20.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Rekawice'), '5');

INSERT INTO Zamowienia VALUES ('20.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Pasha'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Kubeczki'), '2');

INSERT INTO Zamowienia VALUES ('15.00');
INSERT INTO Pracownicy_Zamowienia VALUES ((SELECT ID_Pracownika FROM Pracownicy WHERE Nazwisko = 'Nara'), IDENT_CURRENT('Zamowienia'))
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Waciki'), '5');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Kubeczki'), '15');
INSERT INTO Zamowienia_Produkty VALUES (IDENT_CURRENT('Zamowienia'), (SELECT ID_Produktu FROM Produkty WHERE Nazwa = 'Znieczulenie'), '10');

