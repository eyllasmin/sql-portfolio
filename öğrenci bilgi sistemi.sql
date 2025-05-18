CREATE DATABASE OBS;
USE OBS;

CREATE TABLE OgretimUyesi (
    idOgretimUyesi INT PRIMARY KEY,
    adi VARCHAR(45),
    soyadi VARCHAR(45),
    eposta VARCHAR(45),
    bolumu VARCHAR(45),
    telefon VARCHAR(45),
    adres VARCHAR(45),
    akademikUnvan VARCHAR(45),
    cinsiyet VARCHAR(45)
);



CREATE TABLE Danisman (
    idDanisman INT PRIMARY KEY,
    unvan VARCHAR(45),
    bolum VARCHAR(45)
);


CREATE TABLE Donem (
    Donem_Yariyil VARCHAR(45) PRIMARY KEY,
    Donem_Ortalamasi INT,
    Yil_Sonu_Kredisi INT
);


CREATE TABLE Transkript (
    TC_num INT PRIMARY KEY
);


CREATE TABLE ogrenci (
    ogrenciNumarasi INT PRIMARY KEY,
    Ad VARCHAR(45),
    Soyad VARCHAR(45),
    Adres VARCHAR(45),
    Cinsiyet VARCHAR(45),
    uyruk VARCHAR(45),
    eposta VARCHAR(45),
    telefonNum INT,
    Dogum_Tarihi DATE,
    Transkript_TC_num INT,
    FOREIGN KEY (Transkript_TC_num) REFERENCES Transkript(TC_num)
);


CREATE TABLE DersKayit (
    Ders_Kodu INT PRIMARY KEY,
    Ders_Bilgisi VARCHAR(45),
    AKTS INT,
    Kredi INT,
    Ders_Icerigi VARCHAR(45),
    Ders_Sonuclari VARCHAR(45),
    Derslik VARCHAR(45),
    Ders_Saati VARCHAR(45),
    OgretimUyesi_idOgretimUyesi INT,
    Donem_Yariyil VARCHAR(45),
    ogrenci_ogrenciNumarasi INT,
    FOREIGN KEY (OgretimUyesi_idOgretimUyesi) REFERENCES OgretimUyesi(idOgretimUyesi),
    FOREIGN KEY (Donem_Yariyil) REFERENCES Donem(Donem_Yariyil),
    FOREIGN KEY (ogrenci_ogrenciNumarasi) REFERENCES ogrenci(ogrenciNumarasi)
);


CREATE TABLE DersProgrami (
    Ders_Kodu INT PRIMARY KEY,
    Derslik VARCHAR(45),
    Ders_Saati DATETIME,
    ogrenciNumarasi INT,
    donem VARCHAR(45),
    OgretimUyesi_idOgretimUyesi INT,
    FOREIGN KEY (OgretimUyesi_idOgretimUyesi) REFERENCES OgretimUyesi(idOgretimUyesi)
);


CREATE TABLE DersProgrami_has_DersKayit (
    DersProgrami_Ders_Kodu INT,
    DersProgrami_ogrenciNum INT,
    DersProgrami_OgretimUyesi_idOgretimUyesi INT,
    DersKayit_Ders_Kodu INT,
    DersKayit_OgretimUyesi_idOgretimUyesi INT,
    DersKayit_Donem_Yariyil VARCHAR(45),
    DersKayit_ogrenci_ogrenciNumarasi INT,
    FOREIGN KEY (DersProgrami_Ders_Kodu) REFERENCES DersProgrami(Ders_Kodu),
    FOREIGN KEY (DersKayit_Ders_Kodu) REFERENCES DersKayit(Ders_Kodu)
);


CREATE TABLE DersProgrami_has_OgretimUyesi (
    DersProgrami_Ders_Kodu INT,
    DersProgrami_ogrenciNum INT,
    OgretimUyesi_idOgretimUyesi INT,
    FOREIGN KEY (DersProgrami_Ders_Kodu) REFERENCES DersProgrami(Ders_Kodu),
    FOREIGN KEY (OgretimUyesi_idOgretimUyesi) REFERENCES OgretimUyesi(idOgretimUyesi)
);


CREATE TABLE ogrenci_has_Danisman (
    ogrenci_ogrenciNumarasi INT,
    ogrenci_Transkript_TC_num INT,
    ogrenci_Danisman_idDanisman INT,
    FOREIGN KEY (ogrenci_ogrenciNumarasi) REFERENCES ogrenci(ogrenciNumarasi),
    FOREIGN KEY (ogrenci_Danisman_idDanisman) REFERENCES Danisman(idDanisman)
);


CREATE TABLE ogrenci_has_sinav (
    ogrenci_ogrenciNumarasi INT,
    ogrenci_Transkript_TC_num INT,
    ogrenci_Danisman_idDanisman INT,
    sinav_dersKodu VARCHAR(45),
    DersNotlari_Ders_Kodu INT,
    DersNotlari_ogrenciNumarasi INT,
    DersNotlari_Donem_Yariyil VARCHAR(45),
    FOREIGN KEY (ogrenci_ogrenciNumarasi) REFERENCES ogrenci(ogrenciNumarasi)
);


CREATE TABLE sinav (
    dersKodu VARCHAR(45) PRIMARY KEY,
    vize INT,
    finalNotu INT,
    butunleme INT,
    muafiyetSinavi INT
);


CREATE TABLE sinav_has_DersNotlari (
    sinav_dersKodu VARCHAR(45),
    DersNotlari_Ders_Kodu INT,
    DersNotlari_DersAdi VARCHAR(45),
    DersNotlari_AKTS INT,
    DersNotlari_Kredi INT,
    DersNotlari_HarfNotu VARCHAR(45),
    DersNotlari_ogrenciNumarasi INT,
    DersNotlari_Donem_Yariyil VARCHAR(45),
    DersNotlari_Transkript_TC_num INT,
    FOREIGN KEY (sinav_dersKodu) REFERENCES sinav(dersKodu)
);


CREATE TABLE DersNotlari (
    Ders_Kodu INT PRIMARY KEY,
    Ders_Adi VARCHAR(45),
    AKTS INT,
    Kredi INT,
    HarfNotu VARCHAR(45),
    ogrenci_ogrenciNumarasi INT,
    Donem_Yariyil VARCHAR(45),
    Transkript_TC_num INT,
    FOREIGN KEY (ogrenci_ogrenciNumarasi) REFERENCES ogrenci(ogrenciNumarasi),
    FOREIGN KEY (Donem_Yariyil) REFERENCES Donem(Donem_Yariyil),
    FOREIGN KEY (Transkript_TC_num) REFERENCES Transkript(TC_num)
);
