
-- Veritabanı oluşturulması
CREATE DATABASE UniversiteBilgiSistemi;

-- Veritabanı seçimi
USE UniversiteBilgiSistemi;

-- Ogrenciler tablosu
CREATE TABLE Ogrenciler (
    OgrenciID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    DogumTarihi DATE NOT NULL,
    Bolum VARCHAR(100) NOT NULL
);

-- Dersler tablosu
CREATE TABLE Dersler (
    DersID INT AUTO_INCREMENT PRIMARY KEY,
    DersAdi VARCHAR(100) NOT NULL,
    Kredi INT NOT NULL,
    Bolum VARCHAR(100) NOT NULL
);

-- Notlar tablosu
CREATE TABLE Notlar (
    NotID INT AUTO_INCREMENT PRIMARY KEY,
    OgrenciID INT NOT NULL,
    DersID INT NOT NULL,
    Not INT CHECK (Not BETWEEN 0 AND 100),
    FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
    FOREIGN KEY (DersID) REFERENCES Dersler(DersID)
);

-- Ogrenciler tablosuna veri ekleme
INSERT INTO Ogrenciler (Ad, Soyad, DogumTarihi, Bolum) 
VALUES 
('Ali', 'Veli', '2000-05-20', 'Bilgisayar Mühendisliği'),
('Ayşe', 'Kaya', '1999-03-15', 'Elektrik Elektronik Mühendisliği'),
('Mehmet', 'Demir', '2001-11-10', 'Makine Mühendisliği');

-- Dersler tablosuna veri ekleme
INSERT INTO Dersler (DersAdi, Kredi, Bolum) 
VALUES 
('Veri Tabanı', 4, 'Bilgisayar Mühendisliği'),
('Elektronik Devreler', 3, 'Elektrik Elektronik Mühendisliği'),
('Termodinamik', 5, 'Makine Mühendisliği');

-- Notlar tablosuna veri ekleme
INSERT INTO Notlar (OgrenciID, DersID, Not) 
VALUES 
(1, 1, 90),
(2, 2, 85),
(3, 3, 78);

-- SELECT Sorguları
SELECT * FROM Ogrenciler;
SELECT Ad, Soyad FROM Ogrenciler WHERE Bolum = 'Bilgisayar Mühendisliği';
SELECT DersAdi, Kredi FROM Dersler WHERE Kredi > 4;

-- INSERT INTO Sorguları
INSERT INTO Ogrenciler (Ad, Soyad, DogumTarihi, Bolum) 
VALUES ('Fatma', 'Çelik', '2002-07-25', 'Bilgisayar Mühendisliği');

INSERT INTO Dersler (DersAdi, Kredi, Bolum) 
VALUES ('Algoritmalar', 4, 'Bilgisayar Mühendisliği');

INSERT INTO Notlar (OgrenciID, DersID, Not) 
VALUES (1, 2, 95);

-- UPDATE Sorguları
UPDATE Ogrenciler 
SET Bolum = 'Yazılım Mühendisliği' 
WHERE OgrenciID = 1;

UPDATE Dersler 
SET Kredi = Kredi + 1 
WHERE Bolum = 'Makine Mühendisliği';

UPDATE Notlar 
SET Not = 80 
WHERE NotID = 3;

-- DELETE Sorguları
DELETE FROM Ogrenciler 
WHERE Ad = 'Mehmet';

DELETE FROM Dersler 
WHERE Kredi < 3;

DELETE FROM Notlar 
WHERE Not < 50;
