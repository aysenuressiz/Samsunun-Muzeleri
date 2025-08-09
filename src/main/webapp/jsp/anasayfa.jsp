<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Samsun Müzeleri - Ana Sayfa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .navbar-brand img {
            height: 60px;
            width: auto;
            margin-right: 10px;
            object-fit: contain;
            max-width: 200px;
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
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
        
        /* ATATÜRK ANIT BÖLÜMÜ */
        .anit-section {
            height: 400px;
            background: url('${pageContext.request.contextPath}/images/anit.png') center/cover no-repeat;
            position: relative;
            margin-top: 76px;
        }
        
        .anit-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.7) 0%, rgba(118, 75, 162, 0.7) 100%);
        }
        
        .anit-content {
            position: relative;
            z-index: 2;
            height: 100%;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .anit-title {
            font-size: 3.5rem;
            font-weight: 800;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            margin-bottom: 1rem;
            line-height: 1.2;
        }
        
        .anit-subtitle {
            font-size: 1.3rem;
            font-weight: 300;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
            margin-bottom: 2rem;
            max-width: 600px;
        }
        
        .btn-anit {
            background: linear-gradient(45deg, #007bff, #0056b3);
            border: none;
            padding: 15px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.3);
        }
        
        .btn-anit:hover {
            background: linear-gradient(45deg, #0056b3, #004085);
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(0, 123, 255, 0.4);
        }
        
        .museum-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            overflow: hidden;
            height: 100%;
            border-radius: 15px;
        }
        
        .museum-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        
        .museum-image {
            height: 300px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.3s ease;
        }
        
        .museum-card:hover .museum-image {
            transform: scale(1.05);
        }
        
        .museum-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        
        .museum-description {
            color: #6c757d;
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        
        .museum-location {
            color: #007bff;
            font-size: 0.95rem;
            margin-bottom: 15px;
            font-weight: 500;
        }
        
        .btn-visit {
            background: linear-gradient(45deg, #007bff, #0056b3);
            border: none;
            padding: 12px 25px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        
        .btn-visit:hover {
            background: linear-gradient(45deg, #0056b3, #004085);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.3);
        }
        
        .section-title {
            font-size: 3rem;
            font-weight: 800;
            color: #2c3e50;
            margin-bottom: 20px;
            position: relative;
        }
        
        .section-subtitle {
            font-size: 1.2rem;
            color: #6c757d;
            margin-bottom: 50px;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(45deg, #007bff, #667eea);
            border-radius: 2px;
        }
        
        .stats-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 80px 0;
        }
        
        .stat-card {
            text-align: center;
            padding: 40px 30px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .stat-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        
        .stat-number {
            font-size: 3.5rem;
            font-weight: 800;
            background: linear-gradient(45deg, #007bff, #667eea);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .stat-label {
            color: #6c757d;
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .about-section {
            padding: 100px 0;
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
        
        /* Museum placeholder için ek CSS */
        .museum-placeholder {
            height: 300px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border: 2px dashed #dee2e6;
            transition: transform 0.3s ease;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .anit-section {
                height: 300px;
            }
            .anit-title {
                font-size: 2.5rem;
            }
            .anit-subtitle {
                font-size: 1.1rem;
            }
            .section-title {
                font-size: 2.2rem;
            }
        }
    </style>
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
                <!-- LOGO - ÇOK YÖNLİ KONTROL -->
                <img src="${pageContext.request.contextPath}/images/muzeler/logo.png" alt="Samsun Logo" 
                     style="height: 60px; width: auto; margin-right: 10px; object-fit: contain; max-width: 200px;"
                     onerror="this.onerror=null; this.src='./images/logo.png';"
                     onload="console.log('✅ Logo başarıyla yüklendi:', this.src);">
                <span>Samsun'un Müzeleri</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/">Anasayfa</a>
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

    <!-- Atatürk Anıtı Bölümü -->
    <section class="anit-section">
        <div class="anit-overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="anit-content">
                        <div>
                            <h1 class="anit-title">Samsun'un Kültürel Hazinelerini Keşfedin</h1>
                            <p class="anit-subtitle">
                                Şehrimizin zengin tarihini ve kültürünü müzelerimizde yaşayın. 
                                Atatürk'ün izinde, her köşesinde bir hikaye barındıran Samsun müzelerini ziyaret edin.
                            </p>
                            <a href="${pageContext.request.contextPath}/muzeler" class="btn btn-light btn-anit">
                                <i class="fas fa-compass me-3"></i>Müzeleri Keşfet
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Museums -->
    <section class="py-5" style="padding: 100px 0 !important;">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Öne Çıkan Müzeler</h2>
                <p class="section-subtitle">Samsun'un en popüler müzelerini keşfedin ve tarihi yaşayın</p>
            </div>
            
            <div class="row g-4">
                <c:forEach var="muze" items="${oneCikanMuzeler}">
                    <div class="col-lg-4 col-md-6">
                        <div class="card museum-card h-100">
                            <!-- MÜZE RESMİ - TAM GÜVENLİ ÇÖZÜM -->
                            <c:choose>
                                <c:when test="${not empty muze.kapakFoto}">
                                    <img src="/SamsununMuzeleri/images/muzeler/kapak/${muze.kapakFoto}" 
                                         alt="${muze.ad}" class="museum-image"
                                         onerror="this.src='/SamsununMuzeleri/images/muzeler/kapak/default-museum.jpg'">
                                    
                                </c:when>
                                <c:otherwise>
                                    <!-- Kapak fotoğrafı yoksa placeholder -->
                                    <div class="museum-image museum-placeholder d-flex align-items-center justify-content-center">
                                        <div class="text-center text-muted">
                                            <i class="fas fa-landmark" style="font-size: 3rem; margin-bottom: 15px; color: #6c757d;"></i>
                                            <div style="font-size: 0.9rem; font-weight: 500;">${muze.ad}</div>
                                            <small style="font-size: 0.8rem; color: #adb5bd;">Yakında Fotoğraf Eklenecek</small>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            
                            <div class="card-body d-flex flex-column p-4">
                                <h5 class="museum-title">${muze.ad}</h5>
                                <p class="museum-description flex-grow-1">
                                    <c:choose>
                                        <c:when test="${muze.aciklama.length() > 150}">
                                            ${muze.aciklama.substring(0, 150)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${muze.aciklama}
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                
                                <div class="museum-location">
                                    <i class="fas fa-map-marker-alt me-2"></i>${muze.adres}
                                </div>
                                
                                <div class="d-flex justify-content-between align-items-center">
                                    <c:if test="${not empty muze.girisUcreti}">
                                        <span class="badge bg-success fs-6 px-3 py-2">${muze.girisUcreti}</span>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/muze-detay?id=${muze.id}" 
                                       class="btn btn-primary btn-visit">
                                        <i class="fas fa-eye me-2"></i>Ziyaret Et
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="text-center mt-5">
                <a href="${pageContext.request.contextPath}/muzeler" class="btn btn-outline-primary btn-lg px-5 py-3">
                    <i class="fas fa-th-large me-2"></i>Tüm Müzeleri Görüntüle
                </a>
            </div>
        </div>
    </section>

    <!-- Statistics Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="stat-card">
                        <div class="stat-number">9+</div>
                        <div class="stat-label">İlçe</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-card">
                        <div class="stat-number">10+</div>
                        <div class="stat-label">Müze</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-card">
                        <div class="stat-number">1000+</div>
                        <div class="stat-label">Eser</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-card">
                        <div class="stat-number">50K+</div>
                        <div class="stat-label">Ziyaretçi</div>
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
                        <!-- FOOTER LOGO - ÇOK YÖNLİ KONTROL -->
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Samsun Logo" 
                             style="height: 40px; margin-right: 15px;"
                             onerror="this.onerror=null; this.src='./images/logo.png';">
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

    <!-- LOGO VE MÜZE RESİMLERİ KONTROL SCRIPT'İ -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        console.log('🔍 Resim kontrolleri başlıyor...');
        
        // Logo kontrolü
        const logos = document.querySelectorAll('img[alt="Samsun Logo"]');
        logos.forEach(function(logo, index) {
            console.log(`📸 Logo ${index + 1} kontrol ediliyor:`, logo.src);
            
            logo.onerror = function() {
                console.log(`❌ Logo ${index + 1} yüklenemedi:`, this.src);
                
                // Alternatif yolları dene
                const alternativePaths = [
                    './images/logo.png',
                    'images/logo.png',
                    '/SamsununMuzeleri/images/logo.png'
                ];
                
                let currentIndex = 0;
                const tryNext = () => {
                    if (currentIndex < alternativePaths.length) {
                        console.log(`🔄 Alternatif yol deneniyor: ${alternativePaths[currentIndex]}`);
                        this.src = alternativePaths[currentIndex];
                        currentIndex++;
                    } else {
                        // Hiçbiri çalışmazsa ikon göster
                        this.style.display = 'none';
                        this.insertAdjacentHTML('afterend', '<i class="fas fa-landmark" style="font-size: 2rem; margin-right: 15px; color: #007bff;"></i>');
                        console.log('🏛️ Logo yerine ikon gösteriliyor');
                    }
                };
                
                this.onerror = tryNext;
                tryNext();
            };
        });
        
        // Müze resimleri kontrolü
        const museumImages = document.querySelectorAll('.museum-image');
        console.log(`🏛️ ${museumImages.length} müze resmi kontrol ediliyor...`);
    });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>