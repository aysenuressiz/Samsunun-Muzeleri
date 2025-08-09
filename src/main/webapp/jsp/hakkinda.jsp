<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hakkımızda - Samsun Müzeleri</title>
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
        
        .feature-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            height: 100%;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
        }
        
        .feature-icon {
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
        
        .stats-section {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 80px 0;
        }
        
        .stat-card {
            text-align: center;
            padding: 40px 20px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            border: 1px solid rgba(0,0,0,0.05);
            height: 100%;
        }
        
        .stat-card:hover {
            transform: translateY(-10px);
        }
        
        .stat-number {
            font-size: 3rem;
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
            margin-top: 10px;
        }
        
        .team-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            overflow: hidden;
        }
        
        .team-card:hover {
            transform: translateY(-10px);
        }
        
        .team-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(45deg, #007bff, #667eea);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
            margin: 0 auto 20px;
        }
        
        .timeline {
            position: relative;
            padding: 20px 0;
        }
        
        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0;
            bottom: 0;
            width: 4px;
            background: linear-gradient(to bottom, #007bff, #667eea);
            transform: translateX(-50%);
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 50px;
        }
        
        .timeline-item:nth-child(odd) .timeline-content {
            margin-right: 55%;
            text-align: right;
        }
        
        .timeline-item:nth-child(even) .timeline-content {
            margin-left: 55%;
        }
        
        .timeline-icon {
            position: absolute;
            left: 50%;
            top: 20px;
            transform: translateX(-50%);
            width: 50px;
            height: 50px;
            background: white;
            border: 4px solid #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: #007bff;
        }
        
        .timeline-content {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
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
            .timeline::before {
                left: 30px;
            }
            .timeline-item:nth-child(odd) .timeline-content,
            .timeline-item:nth-child(even) .timeline-content {
                margin-left: 70px;
                margin-right: 0;
                text-align: left;
            }
            .timeline-icon {
                left: 30px;
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/hakkinda">Hakkında</a>
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
                <h1 class="page-title">Hakkımızda</h1>
                <p class="page-subtitle">Samsun'un kültürel mirasını koruyoruz ve paylaşıyoruz</p>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center mb-5">
                <div class="col-lg-6 mb-4">
                    <h2 class="section-title">Misyonumuz</h2>
                    <p class="lead text-muted mb-4">
                        Samsun Müzeleri olarak, şehrimizin zengin tarihini ve kültürel mirasını 
                        korumak, gelecek nesillere aktarmak ve ziyaretçilerimize unutulmaz 
                        deneyimler sunmak için çalışıyoruz.
                    </p>
                    <p class="mb-4">
                        Kurtuluş Savaşı'nın başladığı bu kutsal topraklarda yer alan müzelerimiz, 
                        Atatürk'ün izinde tarihi yaşatmaya devam ediyor. Her bir eserimiz, 
                        geçmişten günümüze uzanan köprülerin birer parçasıdır.
                    </p>
                    <div class="d-flex align-items-center">
                        <div class="me-4">
                            <div class="feature-icon" style="width: 60px; height: 60px; font-size: 1.5rem;">
                                <i class="fas fa-heart"></i>
                            </div>
                        </div>
                        <div>
                            <h5>Kültürel Miras</h5>
                            <p class="text-muted mb-0">Samsun'un binlerce yıllık tarihini koruyoruz</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="/SamsununMuzeleri/images/anit.png" alt="Atatürk Anıtı" 
                         class="img-fluid rounded shadow-lg">
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Neden Biz?</h2>
                <p class="lead text-muted">Samsun müzelerini özel kılan özellikler</p>
            </div>
            
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-landmark"></i>
                            </div>
                            <h5 class="mb-3">Tarihi Değer</h5>
                            <p class="text-muted">
                                Kurtuluş Savaşı'nın başladığı topraklarda, tarihin canlı tanıkları olan 
                                eserlerimizle geçmişi bugüne taşıyoruz.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h5 class="mb-3">Eğitim</h5>
                            <p class="text-muted">
                                Öğrencilerden yetişkinlere kadar her yaş grubuna uygun eğitim 
                                programları ve rehberli turlar düzenliyoruz.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-globe"></i>
                            </div>
                            <h5 class="mb-3">Modern Yaklaşım</h5>
                            <p class="text-muted">
                                Dijital teknolojilerle desteklenen sergileme yöntemlerimizle 
                                tarihi modern bir şekilde sunuyoruz.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <h5 class="mb-3">Koruma</h5>
                            <p class="text-muted">
                                Profesyonel konservasyon teknikleriyle tarihi eserleri 
                                gelecek nesiller için koruyor ve restore ediyoruz.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <h5 class="mb-3">Araştırma</h5>
                            <p class="text-muted">
                                Akademik çalışmalar ve arkeolojik araştırmalarla 
                                Samsun'un tarihine ışık tutmaya devam ediyoruz.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card feature-card">
                        <div class="card-body text-center p-4">
                            <div class="feature-icon">
                                <i class="fas fa-handshake"></i>
                            </div>
                            <h5 class="mb-3">İşbirliği</h5>
                            <p class="text-muted">
                                Ulusal ve uluslararası müze ve kültür kurumlarıyla 
                                işbirlikleri geliştiriyoruz.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Statistics Section -->
    <section class="stats-section">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title text-dark">Rakamlarla Biz</h2>
            </div>
            
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
                        <div class="stat-label">Tarihi Eser</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="stat-card">
                        <div class="stat-number">50K+</div>
                        <div class="stat-label">Yıllık Ziyaretçi</div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
 <!--
    <!-- Timeline Section -->
     <!--<section class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Tarihçemiz</h2>
                <p class="lead text-muted">Samsun müzelerinin kuruluş ve gelişim hikayesi</p>
            </div>
            
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-flag"></i>
                    </div>
                    <div class="timeline-content">
                        <h5>1926 - İlk Müze</h5>
                        <p class="text-muted mb-0">
                            Atatürk'ün direktifleriyle ilk müzemiz kuruldu ve Samsun'un 
                            kültürel mirasını koruma yolculuğu başladı.
                        </p>
                    </div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="timeline-content">
                        <h5>1981 - Gazi Müzesi</h5>
                        <p class="text-muted mb-0">
                            Atatürk'ün Samsun'a çıkışının 62. yıldönümünde Gazi Müzesi açıldı 
                            ve Kurtuluş Savaşı'nın belgeleri sergilenmeye başlandı.
                        </p>
                    </div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-city"></i>
                    </div>
                    <div class="timeline-content">
                        <h5>1998 - Kent Müzesi</h5>
                        <p class="text-muted mb-0">
                            Samsun'un şehir tarihini anlatan Kent Müzesi hizmete girdi ve 
                            yerel kültürün korunmasında önemli rol üstlendi.
                        </p>
                    </div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-anchor"></i>
                    </div>
                    <div class="timeline-content">
                        <h5>2010 - Denizcilik Müzesi</h5>
                        <p class="text-muted mb-0">
                            Karadeniz'in denizcilik mirasını sergileyen müzemiz açılarak 
                            bölgenin maritime kültürünü tanıtmaya başladı.
                        </p>
                    </div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-icon">
                        <i class="fas fa-laptop"></i>
                    </div>
                    <div class="timeline-content">
                        <h5>2025 - Dijital Dönüşüm</h5>
                        <p class="text-muted mb-0">
                            Modern web platformumuzla müzelerimizi dijital ortamda tanıtıyor, 
                            online rehberlik hizmetleri sunuyoruz.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>-->

    <!-- Team Section -->
     <!--<section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Ekibimiz</h2>
                <p class="lead text-muted">Kültürel mirasımızı koruyan uzman ekibimiz</p>
            </div>
            
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card team-card">
                        <div class="card-body text-center p-4">
                            <div class="team-avatar">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <h5 class="mb-2">Dr. Mehmet Yılmaz</h5>
                            <p class="text-primary mb-3">Müze Müdürü</p>
                            <p class="text-muted small">
                                25 yıllık deneyimi ile müze yönetimi ve kültürel miras 
                                koruma alanında uzman.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card team-card">
                        <div class="card-body text-center p-4">
                            <div class="team-avatar">
                                <i class="fas fa-female"></i>
                            </div>
                            <h5 class="mb-2">Prof. Dr. Ayşe Kaya</h5>
                            <p class="text-primary mb-3">Baş Arkeolog</p>
                            <p class="text-muted small">
                                Samsun arkeolojisi konusunda uzman, çok sayıda kazı 
                                çalışmasına öncülük etmiştir.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card team-card">
                        <div class="card-body text-center p-4">
                            <div class="team-avatar">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <h5 class="mb-2">Ahmet Demir</h5>
                            <p class="text-primary mb-3">Eğitim Koordinatörü</p>
                            <p class="text-muted small">
                                Müze eğitimi ve rehberlik hizmetlerinin koordinasyonunu 
                                sağlayan deneyimli eğitimci.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>-->

    <!-- Values Section -->
    <section class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Değerlerimiz</h2>
                <p class="lead text-muted">Çalışmalarımızda rehber aldığımız temel değerler</p>
            </div>
            
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="d-flex align-items-start mb-4">
                        <div class="feature-icon me-4" style="width: 60px; height: 60px; font-size: 1.5rem;">
                            <i class="fas fa-history"></i>
                        </div>
                        <div>
                            <h5>Tarihsel Sorumluluk</h5>
                            <p class="text-muted mb-0">
                                Geçmişten gelen emanetleri korumak ve gelecek nesillere 
                                aktarmak en büyük sorumluluğumuz.
                            </p>
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-start mb-4">
                        <div class="feature-icon me-4" style="width: 60px; height: 60px; font-size: 1.5rem;">
                            <i class="fas fa-eye"></i>
                        </div>
                        <div>
                            <h5>Şeffaflık</h5>
                            <p class="text-muted mb-0">
                                Tüm çalışmalarımızı şeffaflık ilkesi ile yürütüyor, 
                                halkımızla açık iletişim kuruyoruz.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="d-flex align-items-start mb-4">
                        <div class="feature-icon me-4" style="width: 60px; height: 60px; font-size: 1.5rem;">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <div>
                            <h5>Eğitim</h5>
                            <p class="text-muted mb-0">
                                Müzelerimizi eğitim kurumları haline getirarak toplumsal 
                                bilinç artışına katkıda bulunuyoruz.
                            </p>
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-start mb-4">
                        <div class="feature-icon me-4" style="width: 60px; height: 60px; font-size: 1.5rem;">
                            <i class="fas fa-hands-helping"></i>
                        </div>
                        <div>
                            <h5>İşbirliği</h5>
                            <p class="text-muted mb-0">
                                Kültür kurumları, üniversiteler ve sivil toplum kuruluşları 
                                ile güçlü işbirliği içindeyiz.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="py-5" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center text-white">
                    <h2 class="mb-4">Tarihi Yaşamaya Hazır Mısınız?</h2>
                    <p class="lead mb-4">
                        Samsun müzelerini ziyaret ederek şehrimizin zengin kültürel mirasını 
                        keşfetmeye davetlisiniz.
                    </p>
                    <div class="d-flex flex-wrap justify-content-center gap-3">
                        <a href="${pageContext.request.contextPath}/muzeler" 
                           class="btn btn-light btn-lg px-4">
                            <i class="fas fa-eye me-2"></i>Müzeleri Keşfet
                        </a>
                        <a href="${pageContext.request.contextPath}/iletisim" 
                           class="btn btn-outline-light btn-lg px-4">
                            <i class="fas fa-phone me-2"></i>İletişime Geç
                        </a>
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
</body>
</html>