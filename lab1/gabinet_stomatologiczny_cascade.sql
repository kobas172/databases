use Gabinet_Stomatologiczny

--Pracownikow, pacjentow, produktow i zespolow zabiegowych nie usuwamy w celach archiwizacji

UPDATE Typy_Specjalizacji SET Nazwa_Specjalizacji = 'Asystent chirurga' WHERE Nazwa_Specjalizacji = 'Asystentka chirurga';

SELECT * FROM Typy_Specjalizacji
SELECT * FROM Pracownicy


DELETE FROM Typy_Specjalizacji WHERE Nazwa_Specjalizacji = 'Asystent chirurga'

SELECT * FROM Typy_Specjalizacji
SELECT * FROM Pracownicy


UPDATE Pacjenci SET Pesel = '11111111111' WHERE Pesel = '19112233446';

SELECT * FROM Zabiegi
SELECT * FROM Pacjenci
SELECT * FROM Recepta


DELETE FROM Zabiegi WHERE Pacjent = '11111111111'

SELECT * FROM Zabiegi
SELECT * FROM Recepta
SELECT * FROM Przeswietlenia
SELECT * FROM Produkty
SELECT * FROM Zabiegi_Produkty


UPDATE Zespol_Zabiegowy SET ID_Zespolu_Zabiegowego = 'ZZ006' WHERE ID_Zespolu_Zabiegowego = 'ZZ002';

SELECT * FROM Zabiegi
SELECT * FROM Zespol_Zabiegowy


DELETE FROM Zamowienia WHERE Koszt_Dostawy = '5.50'

SELECT * FROM Zamowienia
SELECT * FROM Zamowienia_Produkty


SELECT * FROM Typy_Specjalizacji
SELECT * FROM Pacjenci
SELECT * FROM Typy_Zabiegow
SELECT * FROM Zespol_Zabiegowy
SELECT * FROM Pracownicy
SELECT * FROM Zabiegi
SELECT * FROM Przeswietlenia
SELECT * FROM Recepta
SELECT * FROM Zamowienia
SELECT * FROM Pracownicy_Zamowienia
SELECT * FROM Produkty
SELECT * FROM Zamowienia_Produkty
SELECT * FROM Zabiegi_Produkty