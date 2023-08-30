-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.

CREATE TABLE `siparis_detay`(
    `siparis_detay_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `urun_id` BIGINT UNSIGNED NOT NULL,
    `siparis_id` BIGINT UNSIGNED NOT NULL,
    `miktar` INT NOT NULL,
    `birim_fiyat` DOUBLE(8, 2) NOT NULL
);
ALTER TABLE
    `siparis_detay` ADD PRIMARY KEY `siparis_detay_siparis_detay_id_primary`(`siparis_detay_id`);
CREATE TABLE `siparisler`(
    `siparis_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `musteri_id` BIGINT UNSIGNED NOT NULL,
    `siparis_tarihi` DATETIME NOT NULL,
    `toplam_fiyat` DOUBLE(8, 2) NOT NULL
);
ALTER TABLE
    `siparisler` ADD PRIMARY KEY `siparisler_siparis_id_primary`(`siparis_id`);
CREATE TABLE `kategori`(
    `kategori_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kategori_adi` VARCHAR(50) NOT NULL,
    `aciklama` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `kategori` ADD PRIMARY KEY `kategori_kategori_id_primary`(`kategori_id`);
CREATE TABLE `musteriler`(
    `musteri_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `musteri_adi` VARCHAR(20) NOT NULL,
    `musteri_soyadi` VARCHAR(20) NOT NULL,
    `musteri_email` VARCHAR(50) NOT NULL,
    `musteri_sifre` VARCHAR(20) NOT NULL
);
ALTER TABLE
    `musteriler` ADD PRIMARY KEY `musteriler_musteri_id_primary`(`musteri_id`);
CREATE TABLE `urunler`(
    `urun_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `urun_adi` VARCHAR(100) NOT NULL,
    `urun_fiyati` DOUBLE(8, 2) NOT NULL,
    `stok_miktarÄ±` INT NOT NULL,
    `aciklama` VARCHAR(255) NOT NULL,
    `kategori_id` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `urunler` ADD PRIMARY KEY `urunler_urun_id_primary`(`urun_id`);
CREATE TABLE `odemeler`(
    `odeme_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `siparis_id` BIGINT UNSIGNED NOT NULL,
    `odeme_tarih` DATETIME NOT NULL,
    `tutar` DOUBLE(8, 2) NOT NULL,
    `odeme_tipi` VARCHAR(50) NOT NULL,
    `muster_id` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `odemeler` ADD PRIMARY KEY `odemeler_odeme_id_primary`(`odeme_id`);
ALTER TABLE
    `urunler` ADD CONSTRAINT `urunler_kategori_id_foreign` FOREIGN KEY(`kategori_id`) REFERENCES `kategori`(`kategori_id`);
ALTER TABLE
    `siparis_detay` ADD CONSTRAINT `siparis_detay_urun_id_foreign` FOREIGN KEY(`urun_id`) REFERENCES `urunler`(`urun_id`);
ALTER TABLE
    `siparisler` ADD CONSTRAINT `siparisler_musteri_id_foreign` FOREIGN KEY(`musteri_id`) REFERENCES `musteriler`(`musteri_id`);
ALTER TABLE
    `odemeler` ADD CONSTRAINT `odemeler_siparis_id_foreign` FOREIGN KEY(`siparis_id`) REFERENCES `siparisler`(`siparis_id`);
ALTER TABLE
    `siparis_detay` ADD CONSTRAINT `siparis_detay_siparis_id_foreign` FOREIGN KEY(`siparis_id`) REFERENCES `siparisler`(`siparis_id`);
ALTER TABLE
    `odemeler` ADD CONSTRAINT `odemeler_muster_id_foreign` FOREIGN KEY(`muster_id`) REFERENCES `musteriler`(`musteri_id`);