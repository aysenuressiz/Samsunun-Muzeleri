-- Samsun'un Müzeleri Veritabanı
-- MySQL 8.0+ için uyumlu

-- Veritabanını oluştur
CREATE DATABASE IF NOT EXISTS samsunmuzeleri 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Veritabanını kullan
USE samsunmuzeleri;

-- Admin kullanıcılar tablosu
CREATE TABLE admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Müzeler tablosu
CREATE TABLE muzeler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(255) NOT NULL,
    aciklama LONGTEXT,
    adres VARCHAR(500),
    telefon VARCHAR(20),
    calisma_saatleri VARCHAR(200),
    calisma_gunleri VARCHAR(200),
    giris_ucreti VARCHAR(100),
    lat DECIMAL(10,8),
    lng DECIMAL(11,8),
    kapak_foto VARCHAR(255),
    galeri_foto TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Yorumlar tablosu
CREATE TABLE yorumlar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    muze_id INT NOT NULL,
    ad_soyad VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    yorum TEXT NOT NULL,
    tarih TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    onaylandimi TINYINT(1) DEFAULT 0,
    FOREIGN KEY (muze_id) REFERENCES muzeler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- İletişim mesajları tablosu
CREATE TABLE iletisim_mesajlari (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ad_soyad VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mesaj TEXT NOT NULL,
    tarih TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

