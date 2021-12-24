use Gabinet_Stomatologiczny

CREATE TABLE Typy_Zabiegow (
	 Nazwa_Zabiegow varchar(100) PRIMARY KEY NOT NULL
)

CREATE TABLE Pacjenci (
	Pesel varchar(11) PRIMARY KEY NOT NULL,
	Imie varchar(40),
	Nazwisko varchar(80),
	Wiek int CHECK (Wiek > 0 AND Wiek <= 150),
	Telefon char(11) CHECK (Telefon like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
)

CREATE TABLE Produkty (
	ID_Produktu int identity PRIMARY KEY NOT NULL,
	Nazwa varchar(80) NOT NULL,
	Cena float CHECK (Cena > 0 AND Cena <= 99999) NOT NULL
)

CREATE TABLE Zamowienia (
	ID_Zamowienia int identity PRIMARY KEY NOT NULL,
	Koszt_dostawy float CHECK (Koszt_dostawy > 0 AND Koszt_dostawy <= 9999999) NOT NULL
)

CREATE TABLE Typy_Specjalizacji (
	Nazwa_Specjalizacji varchar(100) PRIMARY KEY
)

CREATE TABLE Zespol_Zabiegowy (
	ID_Zespolu_Zabiegowego char(5) CHECK (ID_Zespolu_Zabiegowego like 'ZZ[0-9][0-9][0-9]') PRIMARY KEY,
	Lekarz_nadzorujacy int		--opiekun
)

CREATE TABLE Pracownicy (
	 ID_Pracownika int identity PRIMARY KEY NOT NULL,
	 Imie varchar(40),
	 Nazwisko varchar(80),
	 Telefon char(11) CHECK (Telefon like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
	 Nazwa_Specjalizacji varchar(100),
	 ID_Zespolu_Zabiegowego char(5) CHECK (ID_Zespolu_Zabiegowego like 'ZZ[0-9][0-9][0-9]'),
	 FOREIGN KEY (Nazwa_Specjalizacji) references Typy_Specjalizacji (Nazwa_Specjalizacji) ON UPDATE CASCADE ON DELETE SET NULL,
	 FOREIGN KEY (ID_Zespolu_Zabiegowego) references Zespol_Zabiegowy (ID_Zespolu_Zabiegowego) ON UPDATE CASCADE
)

CREATE TABLE Zabiegi (
	ID_Zabiegu int identity PRIMARY KEY NOT NULL,
	Zespol_Zabiegowy char(5) CHECK (Zespol_Zabiegowy like 'ZZ[0-9][0-9][0-9]') NOT NULL,
    Pacjent varchar(11) NOT NULL,
    Koszt float CHECK (Koszt > 0 AND Koszt <= 99999) NOT NULL,
    Czy_Wykonano varchar(3) CHECK (Czy_Wykonano like 'TAK' OR Czy_Wykonano like 'NIE') NOT NULL,
	Termin date NOT NULL,
	Nazwa_Zabiegow varchar(100) NOT NULL,
	FOREIGN KEY (Zespol_Zabiegowy) references Zespol_Zabiegowy (ID_Zespolu_Zabiegowego) ON UPDATE CASCADE,
	FOREIGN KEY (Pacjent) references Pacjenci (Pesel) ON UPDATE CASCADE,
	FOREIGN KEY (Nazwa_Zabiegow) references Typy_Zabiegow (Nazwa_Zabiegow) ON UPDATE CASCADE
)

CREATE TABLE Recepta (
	ID_Recepty int identity PRIMARY KEY NOT NULL,
	Data date NOT NULL,
	Lek varchar(80) NOT NULL,
	Pesel varchar(11) NOT NULL,
	ID_Zabiegu int,
	FOREIGN KEY (Pesel) references Pacjenci (Pesel) ON UPDATE CASCADE,
	FOREIGN KEY (ID_Zabiegu) references Zabiegi (ID_Zabiegu) ON DELETE CASCADE
)

CREATE TABLE Zabiegi_Produkty (
	ID_Zabiegu int NOT NULL,
	ID_Produktu int NOT NULL,
	Ilosc int CHECK (Ilosc > 0 AND Ilosc <= 99999) NOT NULL,
	PRIMARY KEY (ID_Zabiegu, ID_Produktu),
	FOREIGN KEY (ID_Zabiegu) references Zabiegi (ID_Zabiegu) ON DELETE CASCADE,
	FOREIGN KEY (ID_Produktu) references Produkty (ID_Produktu) ON DELETE CASCADE
)

CREATE TABLE Przeswietlenia (
	ID_Pantogramu int identity PRIMARY KEY NOT NULL,
	Zdjecie varchar(120) NOT NULL,
	Opis varchar(500),
	ID_Zabiegu int NOT NULL,
	FOREIGN KEY (ID_Zabiegu) references Zabiegi (ID_Zabiegu) ON DELETE CASCADE
)

CREATE TABLE Pracownicy_Zamowienia (
	ID_Pracownika int NOT NULL,
	ID_Zamowienia int NOT NULL,
	PRIMARY KEY (ID_Pracownika, ID_Zamowienia),
	FOREIGN KEY (ID_Pracownika) references Pracownicy (ID_Pracownika) ON DELETE CASCADE,
	FOREIGN KEY (ID_Zamowienia) references Zamowienia (ID_Zamowienia) ON DELETE CASCADE
)

CREATE TABLE Zamowienia_Produkty (
	ID_Zamowienia int NOT NULL,
	ID_Produktu int NOT NULL,
	Ilosc int CHECK (Ilosc > 0 AND Ilosc <= 99999) NOT NULL,
	PRIMARY KEY (ID_Zamowienia, ID_Produktu),
	FOREIGN KEY (ID_Zamowienia) references Zamowienia (ID_Zamowienia) ON DELETE CASCADE,
	FOREIGN KEY (ID_Produktu) references Produkty (ID_Produktu) ON DELETE CASCADE
)
