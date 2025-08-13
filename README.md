# Samsun'un Müzeleri

Samsun ilindeki müzeleri tanıtan ve yöneten modern bir Java Web uygulaması.

## 📋 Proje Hakkında

Bu proje, Samsun'daki müzeleri kullanıcılara tanıtmak ve admin paneli üzerinden müze bilgilerini yönetmek amacıyla geliştirilmiş bir web uygulamasıdır. Kullanıcılar müzeleri görüntüleyebilir, detaylarını inceleyebilir ve yorum yapabilir. Admin kullanıcılar ise müze bilgilerini ekleyebilir, silebilir, düzenleyebilir ve kullanıcı yorumlarını yönetebilir.

## 🚀 Özellikler

### Kullanıcı Tarafı
- **Ana Sayfa**: Atatürk anıtı ile etkileyici giriş sayfası
- **Müze Listesi**: Tüm müzelerin listelendiği sayfa
- **Müze Detayları**: Her müze için detaylı bilgi sayfası
- **Yorum Sistemi**: Kullanıcıların müzelere yorum yapabilmesi
- **Hakkında Sayfası**: Proje hakkında bilgiler
- **İletişim Sayfası**: İletişim bilgileri

### Admin Paneli
- **Dashboard**: İstatistikler ve genel bakış
- **Müze Yönetimi**: Müze ekleme, düzenleme, silme
- **Yorum Yönetimi**: Kullanıcı yorumlarını onaylama/reddetme
- **Güvenli Giriş**: Admin kullanıcı girişi
- 
Bu proje için ekran görüntüleri:

### Ana Sayfa
![Ana Sayfa](ekran-goruntuleri/anasayfa.png)

### Müzeler Sayfası
![Müzeler Sayfası](ekran-goruntuleri/müzeler.png)

### Müze Detay Sayfası
![Müze detay Sayfası](ekran-goruntuleri/müze-detay.png)

### Hakkımızda Sayfası
![Hakkımızda Sayfası](ekran-goruntuleri/hakkımızda.png)

### İletişim Sayfası
![İletişim Sayfası](ekran-goruntuleri/iletişim.png)

### Admin Giriş Sayfası
![Admin Giriş Sayfası](ekran-goruntuleri/admin-giriş.png)

### Admin Dashboard Sayfası
![Admin Dashboard Sayfası](ekran-goruntuleri/admind-dashboard.png)

### Admin Müzeler Sayfası
![Admin Müzeler Sayfası](ekran-goruntuleri/admin-müzeler.png)

### Admin Müze Güncelle Sayfası
![Admin Müze Güncelle Sayfası](ekran-goruntuleri/admin-müze-güncelle.png)

### Admin Müze Ekle Sayfası
![Admin Müze Ekle Sayfası](ekran-goruntuleri/admin-müze-ekle.png)

### Admin Yorumlar Sayfası
![Admin Yorumlar Sayfası](ekran-goruntuleri/admin-yorumlar.png)


### Uygulamaya Erişim
- **Admin Paneli**: 
  - Kullanıcı adı: `admin`
  - Şifre: `admin123`
 
    
## 🛠️ Teknolojiler

- **Backend**: Java 17, Servlet, JSP
- **Veritabanı**: MySQL 8.0
- **Frontend**: Bootstrap 5, Font Awesome
- **Build Tool**: Maven
- **Server**: Apache Tomcat

## 📦 Kurulum

### Gereksinimler
- Java 17 veya üzeri
- Maven 3.6+
- MySQL 8.0
- Apache Tomcat 9.0+


### Adım 1: Veritabanı Kurulumu
```sql
-- MySQL'de yeni veritabanı oluşturun
CREATE DATABASE samsunmuzeleri CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Veritabanını kullanın
USE samsunmuzeleri;

-- Müzeler tablosu
CREATE TABLE muzeler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(255) NOT NULL,
    aciklama TEXT,
    adres TEXT,
    telefon VARCHAR(50),
    calisma_saatleri VARCHAR(100),
    calisma_gunleri VARCHAR(100),
    giris_ucreti VARCHAR(50),
    lat DOUBLE,
    lng DOUBLE,
    kapak_foto VARCHAR(255)
);

-- Yorumlar tablosu
CREATE TABLE yorumlar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    muze_id INT,
    kullanici_adi VARCHAR(100),
    yorum TEXT,
    tarih TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    onaylandi BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (muze_id) REFERENCES muzeler(id) ON DELETE CASCADE
);

-- Admin kullanıcılar tablosu
CREATE TABLE admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Varsayılan admin kullanıcısı (şifre: admin123)
INSERT INTO admin_users (username, password) VALUES ('admin', 'admin123');
```

### Adım 2: Veritabanı Bağlantısı
`src/main/java/com/util/DatabaseConnection.java` dosyasında veritabanı bilgilerini güncelleyin:
```java
private static final String URL = "jdbc:mysql://localhost:3306/samsunmuzeleri?useSSL=false&serverTimezone=UTC";
private static final String USERNAME = "root";
private static final String PASSWORD = "your_password";
```

### Adım 3: Google Maps API Key
Projede Google Maps entegrasyonu bulunmaktadır. Harita özelliklerinin çalışması için:

1. [Google Cloud Console](https://console.cloud.google.com/)'a gidin
2. Yeni bir proje oluşturun veya mevcut projenizi seçin
3. Maps JavaScript API'yi etkinleştirin
4. API Key oluşturun
5. Aşağıdaki dosyalarda `YOUR-API-KEY` yerine kendi API key'inizi yazın:
   - `src/main/webapp/jsp/iletisim.jsp`
   - `src/main/webapp/jsp/admin-muze-ekle.jsp`
   - `src/main/webapp/jsp/admin-muze-guncelle.jsp`
   - `src/main/webapp/jsp/muze-detay.jsp`
   - `src/main/webapp/jsp/muzeler.jsp`

**Not**: API key'inizi güvenlik için environment variable olarak da kullanabilirsiniz.

### Adım 4: Projeyi Derleme ve Çalıştırma
```bash
# Projeyi derleyin
mvn clean package

# WAR dosyasını Tomcat'e kopyalayın
cp target/SamsununMuzeleri-0.0.1-SNAPSHOT.war $TOMCAT_HOME/webapps/

# Tomcat'i başlatın
$TOMCAT_HOME/bin/startup.sh
```

### Adım 5: Uygulamaya Erişim
- **Kullanıcı Arayüzü**: http://localhost:8080/SamsununMuzeleri/
- **Admin Paneli**: http://localhost:8080/SamsununMuzeleri/admin-login
  - Kullanıcı adı: `admin`
  - Şifre: `admin123`

## 📁 Proje Yapısı

```
SamsununMuzeleri/
├── src/
│   ├── main/
│   │   ├── java/com/
│   │   │   ├── dao/          # Veri erişim katmanı
│   │   │   ├── model/        # Veri modelleri
│   │   │   ├── servlet/      # Controller katmanı
│   │   │   └── util/         # Yardımcı sınıflar
│   │   └── webapp/
│   │       ├── css/          # Stil dosyaları
│   │       ├── images/       # Resim dosyaları
│   │       ├── jsp/          # JSP sayfaları
│   │       └── WEB-INF/      # Web konfigürasyonu
├── pom.xml                   # Maven konfigürasyonu
└── README.md                 # Bu dosya
```

## 🔧 Konfigürasyon

### Web.xml Ayarları
- UTF-8 karakter kodlaması
- Statik kaynak mapping (CSS, JS, resimler)
- Session timeout: 30 dakika
- Hata sayfaları tanımlanmış

### Güvenlik
- Admin paneli için session kontrolü
- SQL injection koruması (PreparedStatement kullanımı)
- XSS koruması (JSTL kullanımı)

## 🎨 Tasarım Özellikleri

- **Responsive Tasarım**: Mobil uyumlu
- **Modern UI**: Bootstrap 5 ile modern görünüm
- **Türkçe Arayüz**: Tamamen Türkçe kullanıcı arayüzü
- **İkonlar**: Font Awesome ikonları
- **Gradient Efektler**: Modern görsel efektler

## 📝 Lisans

Bu proje eğitim amaçlı geliştirilmiştir.

## 🤝 Katkıda Bulunma

1. Bu repository'yi fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeni-ozellik`)
5. Pull Request oluşturun

## 📞 İletişim

Proje hakkında sorularınız için issue açabilirsiniz. 
