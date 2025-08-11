<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${muze.ad} - Samsun Müzeleri</title>
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
        
        .navbar-nav .nav-link:hover {
            color: #007bff !important;
            background: rgba(0, 123, 255, 0.1);
            border-radius: 8px;
        }
        
        .hero-section {
            height: 500px;
            background-size: cover;
            background-position: center;
            position: relative;
            margin-top: 76px;
        }
        
        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.3) 100%);
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
            height: 100%;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
            margin-bottom: 20px;
        }
        
        .hero-subtitle {
            font-size: 1.3rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.7);
            opacity: 0.95;
        }
        
        .info-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .info-card:hover {
            transform: translateY(-5px);
        }
        
        .info-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(45deg, #007bff, #0056b3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }
        
        .map-container {
            height: 400px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .comment-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            border-left: 4px solid #007bff;
        }
        
        .comment-form {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 30px;
        }
        
        .btn-comment {
            background: linear-gradient(45deg, #28a745, #20c997);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        
        .btn-comment:hover {
            background: linear-gradient(45deg, #20c997, #17a2b8);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3);
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
            .hero-title {
                font-size: 2.5rem;
            }
            .hero-section {
                height: 400px;
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/iletisim">İletişim</a>
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

    <!-- Hero Section -->
    <section class="hero-section" style="background-image: url('/SamsununMuzeleri/images/muzeler/kapak/${muze.kapakFoto}');">
        <div class="hero-overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="hero-content">
                        <div>
                            <h1 class="hero-title">${muze.ad}</h1>
                            <p class="hero-subtitle">${muze.adres}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Museum Info -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-4">
                    <div class="card info-card">
                        <div class="card-body p-5">
                            <h2 class="section-title">Hakkında</h2>
                            <p class="lead text-muted mb-4">${muze.aciklama}</p>
                            
                            <div class="row mt-4">
                                <c:if test="${not empty muze.calismaSaatleri}">
                                    <div class="col-md-6 mb-3">
                                        <div class="d-flex align-items-center">
                                            <div class="info-icon me-3">
                                                <i class="fas fa-clock"></i>
                                            </div>
                                            <div>
                                                <h6 class="mb-1">Çalışma Saatleri</h6>
                                                <p class="text-muted mb-0">${muze.calismaSaatleri}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                
                                <c:if test="${not empty muze.calismaGunleri}">
                                    <div class="col-md-6 mb-3">
                                        <div class="d-flex align-items-center">
                                            <div class="info-icon me-3">
                                                <i class="fas fa-calendar"></i>
                                            </div>
                                            <div>
                                                <h6 class="mb-1">Çalışma Günleri</h6>
                                                <p class="text-muted mb-0">${muze.calismaGunleri}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                
                                <c:if test="${not empty muze.telefon}">
                                    <div class="col-md-6 mb-3">
                                        <div class="d-flex align-items-center">
                                            <div class="info-icon me-3">
                                                <i class="fas fa-phone"></i>
                                            </div>
                                            <div>
                                                <h6 class="mb-1">Telefon</h6>
                                                <p class="text-muted mb-0">${muze.telefon}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                
                                <c:if test="${not empty muze.girisUcreti}">
                                    <div class="col-md-6 mb-3">
                                        <div class="d-flex align-items-center">
                                            <div class="info-icon me-3">
                                                <i class="fas fa-ticket-alt"></i>
                                            </div>
                                            <div>
                                                <h6 class="mb-1">Giriş Ücreti</h6>
                                                <p class="text-muted mb-0">${muze.girisUcreti}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="card info-card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-map-marker-alt me-2"></i>Konum</h5>
                        </div>
                        <div class="card-body p-0">
                            <div id="map" class="map-container"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Comments Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="section-title text-center mb-5">Ziyaretçi Yorumları</h2>
            
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <!-- Existing Comments -->
                    <c:choose>
                        <c:when test="${not empty yorumlar}">
                            <c:forEach var="yorum" items="${yorumlar}">
                                <div class="comment-card">
                                    <div class="card-body p-4">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <div>
                                                <h6 class="mb-1"><i class="fas fa-user-circle me-2"></i>${yorum.adSoyad}</h6>
                                                <small class="text-muted">
                                                    <i class="fas fa-calendar-alt me-1"></i>
                                                    <fmt:formatDate value="${yorum.tarih}" pattern="dd.MM.yyyy HH:mm" />
                                                </small>
                                            </div>
                                            <div class="text-warning">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                        <p class="mb-0">${yorum.yorum}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-4">
                                <i class="fas fa-comments fa-3x text-muted mb-3"></i>
                                <h5 class="text-muted">Henüz yorum yapılmamış</h5>
                                <p class="text-secondary">İlk yorumu siz yapın!</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    
                    <!-- Comment Form -->
                    <div class="comment-form mt-5">
                        <h4 class="mb-4"><i class="fas fa-edit me-2"></i>Yorumunuzu Paylaşın</h4>
                        
                        <!-- Success/Error Messages -->
                        <c:if test="${param.sonuc == 'basarili'}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle"></i> <strong>Teşekkürler!</strong> Yorumunuz alındı ve onay bekliyor.
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty hata}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle"></i> ${hata}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <form method="post" action="${pageContext.request.contextPath}/yorum-ekle">
                            <input type="hidden" name="muze_id" value="${muze.id}">
                            
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
                            
                            <div class="mb-3">
                                <label for="yorum" class="form-label">Yorumunuz *</label>
                                <textarea class="form-control" id="yorum" name="yorum" rows="4" 
                                          placeholder="Müze hakkındaki görüşlerinizi paylaşın..." required></textarea>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-comment text-white">
                                    <i class="fas fa-paper-plane me-2"></i>Yorumu Gönder
                                </button>
                            </div>
                            
                            <small class="text-muted mt-2 d-block">
                                * Yorumunuz onaylandıktan sonra yayınlanacaktır.
                            </small>
                        </form>
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
            // Müze koordinatları
            const muzeKonum = {lat: ${muze.lat}, lng: ${muze.lng}};
            
            const map = new google.maps.Map(document.getElementById('map'), {
                zoom: 16,
                center: muzeKonum,
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
            
            // Müze marker'ı
            const marker = new google.maps.Marker({
                position: muzeKonum,
                map: map,
                title: '${muze.ad}',
                icon: {
                    url: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png'
                }
            });
            
            // Info window
            const infoWindow = new google.maps.InfoWindow({
                content: `
                    <div style="padding: 10px;">
                        <h6><strong>${muze.ad}</strong></h6>
                        <p class="mb-1">${muze.adres}</p>
                        <small class="text-muted">Haritada göster için tıklayın</small>
                    </div>
                `
            });
            
            marker.addListener('click', () => {
                infoWindow.open(map, marker);
            });
        }
     <script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR-API-KEY&callback=initMap"></script>
</body>
</html>