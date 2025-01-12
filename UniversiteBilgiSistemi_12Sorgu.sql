
-- SELECT Sorguları
-- 1. Tüm öğrencilerin bilgilerini listele
SELECT * FROM Ogrenciler;

-- 2. Bir bölümdeki tüm dersleri listele
SELECT DersAdi, Kredi FROM Dersler WHERE Bolum = 'Bilgisayar Mühendisliği';

-- 3. Öğrencilerin aldığı derslerin not ortalamasını listele
SELECT Ogrenciler.Ad, Ogrenciler.Soyad, AVG(Notlar.Not) AS OrtalamaNot
FROM Notlar
JOIN Ogrenciler ON Notlar.OgrenciID = Ogrenciler.OgrenciID
GROUP BY Ogrenciler.OgrenciID;

-- INSERT INTO Sorguları
-- 1. Yeni bir öğrenci ekle
INSERT INTO Ogrenciler (Ad, Soyad, DogumTarihi, Bolum) 
VALUES ('Fatma', 'Çelik', '2002-07-25', 'Yazılım Mühendisliği');

-- 2. Yeni bir ders ekle
INSERT INTO Dersler (DersAdi, Kredi, Bolum, Donem) 
VALUES ('Yapay Zeka', 3, 'Bilgisayar Mühendisliği', '2024-Bahar');

-- 3. Yeni bir not ekle
INSERT INTO Notlar (OgrenciID, DersID, Not) 
VALUES (1, 1, 95);

-- UPDATE Sorguları
-- 1. Bir öğrencinin bölümünü güncelle
UPDATE Ogrenciler 
SET Bolum = 'Yapay Zeka ve Veri Bilimi' 
WHERE Ad = 'Ali';

-- 2. Bir dersin kredilerini artır
UPDATE Dersler 
SET Kredi = Kredi + 1 
WHERE DersAdi = 'Veri Tabanı';

-- 3. Bir öğrencinin notunu güncelle
UPDATE Notlar 
SET Not = 90 
WHERE NotID = 1;

-- DELETE Sorguları
-- 1. Belirli bir öğrenciyi sil
DELETE FROM Ogrenciler 
WHERE Ad = 'Mehmet';

-- 2. Kredisi 2'den az olan dersleri sil
DELETE FROM Dersler 
WHERE Kredi < 2;

-- 3. Notu 50’nin altında olan tüm kayıtları sil
DELETE FROM Notlar 
WHERE Not < 50;
