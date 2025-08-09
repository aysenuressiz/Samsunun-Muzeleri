<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>İletişim - Samsun Müzeleri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
        }
        
        .navbar-brand img {
            height: 60px;
            width: auto;
            margin-right: 10px;
            object-fit: contain;
            max-width: 200px;
        }
        
        .navbar-brand {
            color: #2c3e50 !important;
            font-weight: 700;
            font-size: 1.5rem;
        }
        
        .navbar-nav .nav-link {
            color: #2c3e50 !important;
            font-weight: 500;
            padding: 10px 15px !important;
            transition: all 0.3s ease;
        }
        
        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: #007bff !important;
            background: rgba(0, 123, 255, 0.1);
            border-radius: 8px;
        }
        
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 120px 0 80px;
            margin-top: 76px;
        }
        
        .page-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 20px;
        }
        
        .page-subtitle {
            font-size: 1.3rem;
            opacity: 0.9;
        }
        
        .section-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: #2c3e50;
            margin-bottom: 30px;
            position: relative;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 80px;
            height: 4px;
            background: linear-gradient(45deg, #007bff, #667eea);
            border-radius: 2px;
        }
        
        .contact-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            height: 100%;
            overflow: hidden;
        }
        
        .contact-card:hover {
            transform: translateY(-10px);
        }
        
        .contact-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #007bff, #0056b3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
            margin: 0 auto 20px;
        }
        
        .contact-form {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 40px;
        }
        
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        
        .btn-send {
            background: linear-gradient(45deg, #28a745, #20c997);
            border: none;
            padding: 15px 40px;
            font-weight: 600;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        
        .btn-send:hover {
            background: linear-gradient(45deg, #20c997, #17a2b8);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3);
        }
        
        .map-container {
            height: 400px;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .faq-item {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 15px;
            overflow: hidden;
        }
        
        .faq-header {
            background: #f8f9fa;
            padding: 20px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        
        .faq-header:hover {
            background: #e9ecef;
        }
        
        .faq-body {
            padding: 20px;
            background: white;
        }
        
        .office-hours {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 20px;
            padding: 30px;
        }
        
        .hours-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        
        .hours-item:last-child {
            border-bottom: none;
        }
        
        .hours-day {
            font-weight: 600;
            color: #2c3e50;
        }
        
        .hours-time {
            color: #28a745;
            font-weight: 500;
        }
        
        .hours-closed {
            color: #dc3545;
            font-weight: 500;
        }
        
        .footer {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 50px 0 30px;
        }
        
        .footer h5 {
            color: #ecf0f1;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .footer a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .footer a:hover {
            color: #3498db;
        }
        
        @media (max-width: 768px) {
            .page-title {
                font-size: 2.5rem;
            }
            .page-header {
                padding: 100px 0 60px;
            }
            .contact-form {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
                <img src="/SamsununMuzeleri/images/logo.png" alt="Samsun Logo">
                <span>Samsun'un Müzeleri</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">Anasayfa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/muzeler">Müzeler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/hakkinda">Hakkında</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/iletisim">İletişim</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin-login">
                            <i class="fas fa-user-shield"></i> Admin
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <div class="text-center">
                <h1 class="page-title">İletişim</h1>
                <p class="page-subtitle">Bizimle iletişime geçin, sorularınızı yanıtlayalım.</p>
            </div>
        </div>
    </section>

    <!-- Contact Info -->
    <section class="py-5">
        <div class="container">
            <div class="row g-4 mb-5">
                <div class="col-lg-4 col-md-6">
                    <div class="card contact-card">
                        <div class="card-body text-center p-4">
                            <div class="contact-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <h5 class="mb-3">Adres</h5>
                            <p class="text-muted mb-0">
                                İlkadım Belediyesi<br>
                                Kadıköy, Barış Blv. No:55, 55040 İlkadım/Samsun<br>
                                Türkiye
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card contact-card">
                        <div class="card-body text-center p-4">
                            <div class="contact-icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <h5 class="mb-3">Telefon</h5>
                            <p class="text-muted mb-2">
                                <strong>Genel Bilgi:</strong><br>
                                0362 444 19 19
                            </p>
                            <p class="text-muted mb-0">
                                <strong>Grup Rezervasyonu:</strong><br>
                                0362 444 19 20
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card contact-card">
                        <div class="card-body text-center p-4">
                            <div class="contact-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <h5 class="mb-3">E-posta</h5>
                            <p class="text-muted mb-2">
                                <strong>Genel:</strong><br>
                                info@samsunmuzeleri.gov.tr
                            </p>
                            <p class="text-muted mb-0">
                                <strong>Eğitim:</strong><br>
                                egitim@samsunmuzeleri.gov.tr
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Form & Map -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-8">
                    <div class="contact-form">
                        <h2 class="section-title">Bize Yazın</h2>
                        
                        <!-- Success/Error Messages -->
                        <c:if test="${param.sonuc == 'basarili'}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle"></i> <strong>Teşekkürler!</strong> Mesajınız alındı, en kısa sürede dönüş yapacağız.
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty hata}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle"></i> ${hata}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <form method="post" action="${pageContext.request.contextPath}/iletisim-gonder">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="ad_soyad" class="form-label">Ad Soyad *</label>
                                    <input type="text" class="form-control" id="ad_soyad" name="ad_soyad" 
                                           placeholder="Adınız ve soyadınız" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">E-posta *</label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           placeholder="ornek@email.com" required>
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="telefon" class="form-label">Telefon</label>
                                    <input type="tel" class="form-control" id="telefon" name="telefon" 
                                           placeholder="0555 555 55 55">
                                </div>
                                <div class="col-md-6">
                                    <label for="konu" class="form-label">Konu *</label>
                                    <select class="form-control" id="konu" name="konu" required>
                                        <option value="">Konu seçiniz</option>
                                        <option value="genel_bilgi">Genel Bilgi</option>
                                        <option value="grup_rezervasyon">Grup Rezervasyonu</option>
                                        <option value="egitim_programi">Eğitim Programı</option>
                                        <option value="etkinlik">Etkinlik</option>
                                        <option value="oneri_sikayet">Öneri/Şikayet</option>
                                        <option value="diger">Diğer</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="mesaj" class="form-label">Mesajınız *</label>
                                <textarea class="form-control" id="mesaj" name="mesaj" rows="6" 
                                          placeholder="Mesajınızı buraya yazın..." required></textarea>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-send text-white">
                                    <i class="fas fa-paper-plane me-2"></i>Mesajı Gönder
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <!-- Office Hours -->
                    <div class="office-hours mb-4">
                        <h4 class="mb-4"><i class="fas fa-clock me-2"></i>Çalışma Saatleri</h4>
                        
                        <div class="hours-item">
                            <span class="hours-day">Hafta içi</span>
                            <span class="hours-time">08:30 - 17:00</span>
                        </div>
                                                
                        <div class="hours-item">
                            <span class="hours-day">Hafta sonu</span>
                            <span class="hours-closed">Kapalı</span>
                        </div>
                        
                        <div class="hours-item">
                            <span class="hours-day">Resmi Tatiller</span>
                            <span class="hours-closed">Kapalı</span>
                        </div>
                        
                        <div class="mt-3 p-3 bg-info bg-opacity-10 rounded">
                            <small class="text-info">
                                <i class="fas fa-info-circle me-2"></i>
                                <strong>Not:</strong> Grup ziyaretleri için önceden rezervasyon gereklidir.
                            </small>
                        </div>
                    </div>
                    
                    <!-- Quick Contact -->
                    <div class="contact-card">
                        <div class="card-body p-4">
                            <h5 class="mb-3"><i class="fas fa-headset me-2"></i>Acil Durum</h5>
                            <p class="text-muted mb-3">
                                Acil durumlar için güvenlik birimimize ulaşabilirsiniz.
                            </p>
                            <div class="d-grid gap-2">
                                <a href="tel:+903621234567" class="btn btn-outline-primary">
                                    <i class="fas fa-phone me-2"></i>Güvenlik: 0362 444 19 69
                                </a>
                                <a href="mailto:guvenlik@samsunmuzeleri.gov.tr" class="btn btn-outline-secondary">
                                    <i class="fas fa-envelope me-2"></i>E-posta Gönder
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <section class="py-5">
        <div class="container">
            <div class="text-center mb-4">
                <h2 class="section-title">Bizi Bulun</h2>
                <p class="lead text-muted">İlkadım Belediyesi konumu</p>
            </div>
            
            <div class="map-container" id="map"></div>
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-car text-primary me-3" style="font-size: 1.5rem;"></i>
                        <div>
                            <h6>Özel Araç ile</h6>
                            <p class="text-muted mb-0">Belediye binası önünde ücretsiz park alanı mevcuttur.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-bus text-success me-3" style="font-size: 1.5rem;"></i>
                        <div>
                            <h6>Toplu Taşıma</h6>
                            <p class="text-muted mb-0">E4, E5, E6, E7, T3, T4, R6B, 3, 16, 22, 24A, 25, 26, 28 numaralı otobüslerle ulaşabilirsiniz.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Sık Sorulan Sorular</h2>
                <p class="lead text-muted">Merak ettiğiniz soruların cevapları</p>
            </div>
            
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="accordion" id="faqAccordion">
                        <div class="faq-item">
                            <div class="faq-header" data-bs-toggle="collapse" data-bs-target="#faq1">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Müze giriş ücretleri nedir?</h6>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                            </div>
                            <div id="faq1" class="collapse show" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    <p class="text-muted mb-0">
                                        Müze giriş ücretleri müzeye göre değişiklik göstermektedir. 
                                        Öğrenci ve grup indirimleri mevcuttur.
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="faq-item">
                            <div class="faq-header" data-bs-toggle="collapse" data-bs-target="#faq2">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Müzelerde fotoğraf çekebilir miyim?</h6>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                            </div>
                            <div id="faq2" class="collapse" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    <p class="text-muted mb-0">
                                        Evet, müzelerimizde flaşsız fotoğraf çekimi serbesttir. 
                                        Ancak bazı özel eserlerin fotoğraflanması yasaktır. 
                                        Ticari amaçlı çekim için önceden izin alınması gerekmektedir.
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="faq-item">
                            <div class="faq-header" data-bs-toggle="collapse" data-bs-target="#faq3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Grup ziyaretleri nasıl organize edilir?</h6>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                            </div>
                            <div id="faq3" class="collapse" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    <p class="text-muted mb-0">
                                        10 kişi ve üzeri gruplar için önceden rezervasyon yapılması gerekmektedir. 
                                        Rehberli tur hizmeti ve grup indirimi sağlanmaktadır. 
                                        Rezervasyon için 0362 444 19 20 numaralı telefonu arayabilirsiniz.
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="faq-item">
                            <div class="faq-header" data-bs-toggle="collapse" data-bs-target="#faq4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Engelli erişimi var mı?</h6>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                            </div>
                            <div id="faq4" class="collapse" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    <p class="text-muted mb-0">
                                        Tüm müzelerimiz engelli erişimine uygun olarak tasarlanmıştır. 
                                        Rampa, asansör ve engelli tuvaleti mevcuttur. 
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="faq-item">
                            <div class="faq-header" data-bs-toggle="collapse" data-bs-target="#faq5">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Eğitim programları var mı?</h6>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                            </div>
                            <div id="faq5" class="collapse" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    <p class="text-muted mb-0">
                                        Okul öncesi, ilkokul, ortaokul ve lise öğrencileri için 
                                        yaş gruplarına uygun eğitim programları düzenlenmektedir. 
                                        Atölye çalışmaları ve drama etkinlikleri de mevcuttur. 
                                        Detaylı bilgi için egitim@samsunmuzeleri.gov.tr adresine yazabilirsiniz.
                                    </p>
                                </div>
                            </div>                            
                        </div>
                        <div class="mt-3 p-3 bg-info bg-opacity-10 rounded">
                            <small class="text-info">
                                <i class="fas fa-info-circle me-2"></i>
                                <strong>Not:</strong> Bu web sitesi İlkadım belediyesi bilgi işlem stajı sırasında Ayşenur Eşsiz tarafından yapılmıştır.
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  

    <!-- Social Media & Newsletter -->
    <section class="py-5" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 text-white mb-4 mb-lg-0">
                    <h3 class="mb-3">Bizi Takip Edin</h3>
                    <p class="mb-4">
                        Müzelerimizden haberdar olmak ve etkinliklerimizi kaçırmamak için 
                        sosyal medya hesaplarımızı takip edin.
                    </p>
                    <div class="d-flex gap-3">
                        <a href="#" class="btn btn-outline-light btn-lg">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="btn btn-outline-light btn-lg">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="btn btn-outline-light btn-lg">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="btn btn-outline-light btn-lg">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bg-white rounded p-4">
                        <h5 class="mb-3">E-Bülten Aboneliği</h5>
                        <p class="text-muted mb-3">Etkinlik ve duyurularımızdan haberdar olun</p>
                        <form class="d-flex gap-2">
                            <input type="email" class="form-control" placeholder="E-posta adresiniz">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane"></i>
                            </button>
                        </form>
                        <small class="text-muted">
                            Kişisel verileriniz gizlilik politikamız kapsamında korunmaktadır.
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="d-flex align-items-center mb-3">
                        <img src="/SamsununMuzeleri/images/logo.png" alt="Samsun Logo" style="height: 40px; margin-right: 15px;">
                        <h5 class="mb-0">Samsun'un Müzeleri</h5>
                    </div>
                    <p class="text-muted">Samsun'un kültürel mirasını yaşatıyoruz ve gelecek nesillere aktarıyoruz.</p>
                </div>
                <div class="col-lg-4 mb-4">
                    <h5>Hızlı Linkler</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/">Anasayfa</a></li>
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/muzeler">Müzeler</a></li>
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/hakkinda">Hakkında</a></li>
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/iletisim">İletişim</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 mb-4">
                    <h5>İletişim</h5>
                    <p class="text-muted">
                        <i class="fas fa-phone me-2"></i>0362 444 55 01<br>
                        <i class="fas fa-envelope me-2"></i>info@samsunmuzeleri.gov.tr<br>
                        <i class="fas fa-map-marker-alt me-2"></i>Samsun, Türkiye
                    </p>
                </div>
            </div>
            <hr class="my-4" style="border-color: rgba(255,255,255,0.1);">
            <div class="text-center">
                <p class="text-muted mb-0">&copy; 2025 Samsun Müzeleri. Tüm hakları saklıdır.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function initMap() {
            // Samsun Müzeleri Müdürlüğü konumu
            const office = {lat: 41.27760312999954, lng: 36.303890123963356};
            
            const map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: office,
                styles: [
                    {
                        "featureType": "all",
                        "elementType": "geometry.fill",
                        "stylers": [{"weight": "2.00"}]
                    },
                    {
                        "featureType": "all",
                        "elementType": "geometry.stroke",
                        "stylers": [{"color": "#9c9c9c"}]
                    }
                ]
            });
            
            // Ana ofis marker'ı
            const marker = new google.maps.Marker({
                position: office,
                map: map,
                title: 'İlkadım Belediyesi',
                icon: {
                    url: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png'
                }
            });
            
            // Info window
            const infoWindow = new google.maps.InfoWindow({
                content: '<div style="padding: 15px; max-width: 250px;">' +
                        '<h6><strong>İlkadım Belediyesi</strong></h6>' +
                        '<p class="mb-2">Kadıköy, Barış Blv. No:55, 55040 İlkadım/Samsun</p>' +
                        '<p class="mb-2">' +
                        '<i class="fas fa-phone me-2"></i>0362 444 19 19<br>' +
                        '<i class="fas fa-envelope me-2"></i>info@samsunmuzeleri.gov.tr' +
                        '</p>' +
                        '<p class="mb-0">' +
                        '<strong>Çalışma Saatleri:</strong><br>' +
                        'Hafta içi: 08:30-17:00<br>' +
                        '</p>' +
                        '</div>'
            });
            
            marker.addListener('click', () => {
                infoWindow.open(map, marker);
            });
            
            // Başlangıçta info window'u aç
            infoWindow.open(map, marker);
        }
    </script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGR30WbKSiOQS4OuBnyR0iBAHG01EXjh4&callback=initMap">
</script>
</body>
</html>