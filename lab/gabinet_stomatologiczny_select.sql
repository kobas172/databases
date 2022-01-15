use Gabinet_Stomatologiczny

-- 1. Sporz�d� zestawienie zabieg�w przeprowadzonych przez zesp� zabiegowy X, kt�re s� typu Y oraz kosztowa�y wi�cej ni� Z.

SELECT Zabiegi.Zespol_Zabiegowy, Zabiegi.Nazwa_Zabiegow, Zabiegi.Koszt
	FROM Zabiegi
	WHERE Zabiegi.Zespol_Zabiegowy = 'ZZ005'
	AND Zabiegi.Nazwa_Zabiegow = 'Nakladki ortodontyczne'
	AND Zabiegi.Czy_Wykonano = 'TAK'
	AND Zabiegi.Koszt > 1000;

-- 2. Sporz�d� list� (posortowan� alfabetycznie) doros�ych pacjent�w, kt�rych zabiegi s� zaplanowane na przysz�y rok.

SELECT Pacjenci.Imie, Pacjenci.Nazwisko, Zabiegi.Termin
	FROM Pacjenci JOIN Zabiegi
	ON Pacjenci.Pesel = Zabiegi.Pacjent
	WHERE Zabiegi.Termin >= '01/01/2022'
	AND Zabiegi.Czy_Wykonano = 'NIE'
	AND Pacjenci.Wiek >= 18
	ORDER BY Pacjenci.Nazwisko;

-- 3. Wylistuj wszystkich pracownik�w (posortowanych alfabetycznie), kt�rzy wykonali przynajmniej dwa zam�wienia.
-- (Nie da si� zrealizowa� "w ostatnim roku", bo nie prowadz� daty zam�wienia w bazie danych.)

CREATE VIEW Zamowienia_Pracownikow
	(Imie_Pracownika, Nazwisko_Pracownika, Ilosc_Zamowien)
	AS SELECT Pracownicy.Imie, Pracownicy.Nazwisko, COUNT (Pracownicy_Zamowienia.ID_Zamowienia) AS Ilosc_Zamowien
	FROM Pracownicy, Pracownicy_Zamowienia
	WHERE Pracownicy.ID_Pracownika = Pracownicy_Zamowienia.ID_Pracownika
	GROUP BY Pracownicy.Imie, Pracownicy.Nazwisko


SELECT * 
	FROM Zamowienia_Pracownikow
	WHERE Ilosc_Zamowien > 1;
DROP VIEW Zamowienia_Pracownikow;

-- 4. Sporz�dz zestawienie pracownik�w uporz�dkowane (malej�co) wed�ug ilo�ci wykonanych zabieg�w. Wynikowa tabela 
--     powinna wy�wie�wietla� informacje o pracowniku, liczb� wykonanych zabieg�w, a tak�e ��czny koszt poniesiony przez pacjent�w.

SELECT Pracownicy.Imie, Pracownicy.Nazwisko, COUNT(Zabiegi.ID_Zabiegu) AS Liczba_Zabiegow, SUM(Zabiegi.Koszt) AS Laczny_Koszt 
	FROM Pracownicy, Zespol_Zabiegowy, Zabiegi
	WHERE Pracownicy.ID_Zespolu_Zabiegowego = Zespol_Zabiegowy.ID_Zespolu_Zabiegowego 
	AND Zabiegi.Zespol_Zabiegowy = Zespol_Zabiegowy.ID_Zespolu_Zabiegowego
	GROUP BY Pracownicy.Imie, Pracownicy.Nazwisko
	ORDER BY Liczba_Zabiegow DESC;

-- 5. Sporz�d� zestawienie typ�w zabieg�w wraz ze �redni� ilo�ci� produkt�w potrzebnych na wykonanie zabiegu z tej kategorii.

CREATE VIEW Produkty_Zamowienia
	(Typy_Zabiegow, Ilosc_Zabiegow, Produkty_Ilosc)
	AS SELECT Zabiegi.Nazwa_Zabiegow, COUNT (Zabiegi_Produkty.ID_Zabiegu) AS Ilosc_Zabiegow, SUM (Zabiegi_Produkty.Ilosc) AS Ilosc_Produktow
	FROM Zabiegi, Zabiegi_Produkty
	WHERE Zabiegi.ID_Zabiegu = Zabiegi_Produkty.ID_Zabiegu
	AND Zabiegi.Czy_Wykonano = 'TAK'
	GROUP BY Zabiegi.Nazwa_Zabiegow;


SELECT Typy_Zabiegow, CAST(Produkty_Ilosc AS float)/CAST(Ilosc_Zabiegow AS float) AS Srednia_Ilosc FROM Produkty_Zamowienia
DROP VIEW Produkty_Zamowienia;

-- 6. Sporz�dz list� pacjent�w, kt�rzy wykonali wi�cej ni� jeden zabieg w gabinecie. W li�cie uwzgl�dnij �aczny koszt zabieg�w.

SELECT Pacjenci.Pesel, SUM (Zabiegi.Koszt) AS Calkowity_Koszt, COUNT (Zabiegi.ID_Zabiegu) AS Ilosc_Zabiegow
	FROM Pacjenci, Zabiegi
	WHERE Pacjenci.Pesel = Zabiegi.Pacjent
	AND Zabiegi.Czy_Wykonano = 'TAK'
	GROUP BY Pacjenci.Pesel
	HAVING COUNT (Zabiegi.ID_Zabiegu) > 1;

-- 7. Stomatolog zachorowal na COVID i potrzebny jest numer oraz imie pacjentow, ktorzy byli leczeni od 10 do 20 grudnia 2021.

SELECT Pacjenci.Imie, Pacjenci.Telefon
	FROM Pacjenci JOIN Zabiegi
	ON Pacjenci.Pesel = Zabiegi.Pacjent
	WHERE Zabiegi.Termin BETWEEN '12/10/2021' AND '12/20/2021';

-- 8. Dla ka�dego zabiegu powy�ej 1000 z�otych wypisz indeks zespo�u zabiegowego i identyfikator lekarza nadzoruj�cego. 

SELECT Zabiegi.Nazwa_Zabiegow, Zespol_Zabiegowy.Lekarz_nadzorujacy, Zabiegi.Koszt
	FROM Zespol_Zabiegowy JOIN Zabiegi
	ON Zespol_Zabiegowy.ID_Zespolu_Zabiegowego = Zabiegi.Zespol_Zabiegowy
	WHERE Zabiegi.Koszt > 1000
	AND Zabiegi.Czy_Wykonano = 'TAK';

-- 9. Wypisz nazwiska lekarzy nadzoruj�cych w gabinecie stomatologicznym.

SELECT Pracownicy.Nazwisko
	FROM Pracownicy
	WHERE Pracownicy.ID_Pracownika IN
		(SELECT Zespol_Zabiegowy.Lekarz_nadzorujacy
		FROM Zespol_Zabiegowy);

-- 10. Wypisz nazwy wszystkich produkt�w u�ytych w zabiegach.

SELECT Produkty.Nazwa
	FROM Produkty
	WHERE Produkty.ID_Produktu IN
		(SELECT Zabiegi_Produkty.ID_Produktu
		FROM Zabiegi_Produkty);

-- Dodatkowe zapytanie: 

-- 11. Widok zawieraj�cy nazw� zabiegu, dane na temat pacjenta, zesp� zabiegowy oraz koszt wykonanych zabieg�w.

CREATE VIEW Informacje_Zabiegi
	(Nazwa_Zabiegu, Imie_Pacjenta, Nazwisko_Pacjenta, Pesel_Pacjenta, Zespol_Zabiegowy, Koszt)
	AS SELECT Zabiegi.Nazwa_Zabiegow, Pacjenci.Imie, Pacjenci.Nazwisko, Zabiegi.Pacjent, Zabiegi.Zespol_Zabiegowy, Zabiegi.Koszt
	FROM Zabiegi, Pacjenci
	WHERE Zabiegi.Czy_Wykonano = 'TAK'
	AND Zabiegi.Pacjent = Pacjenci.Pesel;

SELECT * FROM Informacje_Zabiegi;
DROP VIEW Informacje_Zabiegi;
