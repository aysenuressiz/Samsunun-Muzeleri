<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tüm Müzeler - Samsun Müzeleri</title>
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
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 20px;
        }
        
        .page-subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        
        .museum-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            overflow: hidden;
            height: 100%;
            border-radius: 15px;
            margin-bottom: 30px;
        }
        
        .museum-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        
        .museum-image {
            height: 250px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.3s ease;
        }
        
        .museum-card:hover .museum-image {
            transform: scale(1.05);
        }
        
        .museum-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        
        .museum-description {
            color: #6c757d;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        
        .museum-info {
            font-size: 0.9rem;
            margin-bottom: 8px;
        }
        
        .museum-location {
            color: #007bff;
            font-weight: 500;
        }
        
        .museum-hours {
            color: #28a745;
        }
        
        .museum-price {
            color: #dc3545;
            font-weight: 600;
        }
        
        .btn-visit {
            background: linear-gradient(45deg, #007bff, #0056b3);
            border: none;
            padding: 10px 20px;
            font-size: 0.95rem;
            font-weight: 600;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        
        .btn-visit:hover {
            background: linear-gradient(45deg, #0056b3, #004085);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
        }
        
        .filter-section {
            background: #f8f9fa;
            padding: 30px 0;
        }
        
        .filter-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .stats-bar {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
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
                font-size: 2.2rem;
            }
            .page-header {
                padding: 100px 0 60px;
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/muzeler">Müzeler</a>
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

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <div class="text-center">
                <h1 class="page-title">Samsun Müzeleri</h1>
                <p class="page-subtitle">Şehrimizin tüm müzelerini keşfedin ve kültürel yolculuğunuza başlayın</p>
            </div>
        </div>
    </section>

    <!-- Stats Bar -->
    <section class="py-4">
        <div class="container">
            <div class="stats-bar">
                <div class="row text-center">
                    <div class="col-md-3 col-6">
                        <h4 class="text-primary mb-1">${tumMuzeler.size()}</h4>
                        <small class="text-muted">Toplam Müze</small>
                    </div>
                    <div class="col-md-3 col-6">
                        <h4 class="text-success mb-1">5+</h4>
                        <small class="text-muted">İlçe</small>
                    </div>
                    <div class="col-md-3 col-6">
                        <h4 class="text-warning mb-1">1000+</h4>
                        <small class="text-muted">Eser</small>
                    </div>
                    <div class="col-md-3 col-6">
                        <h4 class="text-info mb-1">50K+</h4>
                        <small class="text-muted">Ziyaretçi</small>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Museums List -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <c:choose>
                    <c:when test="${not empty tumMuzeler}">
                        <c:forEach var="muze" items="${tumMuzeler}">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card museum-card h-100">
                                    <img src="/SamsununMuzeleri/images/muzeler/kapak/${muze.kapakFoto}" 
                                         alt="${muze.ad}" class="museum-image"
                                         onerror="this.src='/SamsununMuzeleri/images/muzeler/kapak/default-museum.jpg'">
                                    
                                    <div class="card-body d-flex flex-column p-4">
                                        <h5 class="museum-title">${muze.ad}</h5>
                                        
                                        <p class="museum-description flex-grow-1">
                                            <c:choose>
                                                <c:when test="${muze.aciklama.length() > 120}">
                                                    ${muze.aciklama.substring(0, 120)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${muze.aciklama}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        
                                        <div class="museum-details mb-3">
                                            <div class="museum-info museum-location">
                                                <i class="fas fa-map-marker-alt me-2"></i>${muze.adres}
                                            </div>
                                            
                                            <c:if test="${not empty muze.calismaSaatleri}">
                                                <div class="museum-info museum-hours">
                                                    <i class="fas fa-clock me-2"></i>${muze.calismaSaatleri}
                                                </div>
                                            </c:if>
                                            
                                            <c:if test="${not empty muze.calismaGunleri}">
                                                <div class="museum-info">
                                                    <i class="fas fa-calendar me-2 text-info"></i>${muze.calismaGunleri}
                                                </div>
                                            </c:if>
                                            
                                            <c:if test="${not empty muze.telefon}">
                                                <div class="museum-info">
                                                    <i class="fas fa-phone me-2 text-secondary"></i>${muze.telefon}
                                                </div>
                                            </c:if>
                                        </div>
                                        
                                        <div class="d-flex justify-content-between align-items-center">
                                            <c:choose>
                                                <c:when test="${not empty muze.girisUcreti}">
                                                    <span class="badge bg-success fs-6 px-3 py-2">${muze.girisUcreti}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary fs-6 px-3 py-2">Bilgi Yok</span>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                            <a href="${pageContext.request.contextPath}/muze-detay?id=${muze.id}" 
                                               class="btn btn-primary btn-visit">
                                                <i class="fas fa-eye me-2"></i>Detaylar
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12">
                            <div class="text-center py-5">
                                <i class="fas fa-building fa-4x text-muted mb-4"></i>
                                <h4 class="text-muted">Henüz müze bulunmuyor</h4>
                                <p class="text-secondary">Yakında yeni müzeler eklenecek!</p>
                                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                                    <i class="fas fa-home me-2"></i>Ana Sayfaya Dön
                                </a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
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

     <script async defer src="https://maps.googleapis.com/maps/api/js?key=${pageContext.request.contextPath}/api-key&callback=initMap"></script>
</body>
</html>