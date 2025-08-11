<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yeni Müze Ekle - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        #map {
            height: 300px;
            border-radius: 10px;
            cursor: crosshair;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <div class="d-flex flex-column p-3 text-white">
                    <div class="text-center mb-4">
                        <i class="fas fa-university fa-2x mb-2"></i>
                        <h5>Admin Panel</h5>
                        <small>Hoş geldiniz, ${sessionScope.admin.username}</small>
                    </div>
                    
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/admin-dashboard" 
                               class="nav-link text-white">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin-muzeler" 
                               class="nav-link text-white">
                                <i class="fas fa-building"></i> Müzeler
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin-muze-ekle" 
                               class="nav-link text-white active">
                                <i class="fas fa-plus"></i> Müze Ekle
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin-yorumlar" 
                               class="nav-link text-white">
                                <i class="fas fa-comments"></i> Yorumlar
                                <c:if test="${bekleyenYorum > 0}">
                                    <span class="badge bg-warning">${bekleyenYorum}</span>
                                </c:if>
                            </a>
                        </li>
                    </ul>
                    
                    <form method="post" action="${pageContext.request.contextPath}/admin-logout" class="mt-auto">
                        <button type="submit" class="btn btn-outline-light btn-sm w-100">
                            <i class="fas fa-sign-out-alt"></i> Çıkış Yap
                        </button>
                    </form>
                </div>
            </div>
            
            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-plus"></i> Yeni Müze Ekle</h2>
                    <a href="${pageContext.request.contextPath}/admin-muzeler" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Geri Dön
                    </a>
                </div>
                
                <!-- Hata Mesajları -->
                <c:if test="${not empty hata}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle"></i> ${hata}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h5><i class="fas fa-info-circle"></i> Müze Bilgileri</h5>
                            </div>
                            <div class="card-body">
                                <form method="post" action="${pageContext.request.contextPath}/admin-muze-ekle" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="ad" class="form-label">Müze Adı *</label>
                                            <input type="text" class="form-control" id="ad" name="ad" 
                                                   placeholder="Örn: Gazi Müzesi" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="telefon" class="form-label">Telefon</label>
                                            <input type="text" class="form-control" id="telefon" name="telefon" 
                                                   placeholder="Örn: 0362 123 45 67">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="aciklama" class="form-label">Açıklama *</label>
                                        <textarea class="form-control" id="aciklama" name="aciklama" rows="4" 
                                                  placeholder="Müze hakkında detaylı bilgi..." required></textarea>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="adres" class="form-label">Adres *</label>
                                        <input type="text" class="form-control" id="adres" name="adres" 
                                               placeholder="Örn: İlkadım/Samsun" required>
                                    </div>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <label for="calisma_saatleri" class="form-label">Çalışma Saatleri</label>
                                            <input type="text" class="form-control" id="calisma_saatleri" name="calisma_saatleri" 
                                                   placeholder="Örn: 09:00 - 17:00">
                                        </div>
                                        <div class="col-md-4">
                                            <label for="calisma_gunleri" class="form-label">Çalışma Günleri</label>
                                            <input type="text" class="form-control" id="calisma_gunleri" name="calisma_gunleri" 
                                                   placeholder="Örn: Salı - Pazar">
                                        </div>
                                        <div class="col-md-4">
                                            <label for="giris_ucreti" class="form-label">Giriş Ücreti</label>
                                            <input type="text" class="form-control" id="giris_ucreti" name="giris_ucreti" 
                                                   placeholder="Örn: Ücretsiz">
                                        </div>
                                    </div>
                                    
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="lat" class="form-label">Enlem (Latitude) *</label>
                                            <input type="number" step="any" class="form-control" id="lat" name="lat" 
                                                   placeholder="41.2867" required readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="lng" class="form-label">Boylam (Longitude) *</label>
                                            <input type="number" step="any" class="form-control" id="lng" name="lng" 
                                                   placeholder="36.3308" required readonly>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="kapak_foto" class="form-label">Kapak Fotoğrafı</label>
                                        <input type="file" class="form-control" id="kapak_foto" name="kapak_foto" 
                                               accept="image/*" onchange="previewImage(this)">
                                        <div class="form-text">JPG, PNG, GIF formatlarında maksimum 10MB</div>
                                        <div id="imagePreview" class="mt-3" style="display: none;">
                                            <img id="preview" src="" alt="Önizleme" style="max-width: 200px; max-height: 150px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                        <a href="${pageContext.request.contextPath}/admin-muzeler" 
                                           class="btn btn-secondary me-md-2">İptal</a>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save"></i> Müzeyi Kaydet
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h6><i class="fas fa-map"></i> Konum Seçimi</h6>
                            </div>
                            <div class="card-body">
                                <p class="text-muted small">Haritaya tıklayarak müzenin konumunu seçin</p>
                                <div id="map"></div>
                                <div class="mt-2">
                                    <small class="text-success" id="coordinateInfo">
                                        Haritaya tıklayın
                                    </small>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mt-3">
                            <div class="card-header">
                                <h6><i class="fas fa-lightbulb"></i> İpuçları</h6>
                            </div>
                            <div class="card-body">
                                <ul class="small text-muted mb-0">
                                    <li>* ile işaretli alanlar zorunludur</li>
                                    <li>Koordinatları haritadan seçebilirsiniz</li>
                                    <li>Açıklama detaylı olmalıdır</li>
                                    <li>Telefon numarası 0362 xxx xx xx formatında</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let map;
        let marker;

        function initMap() {
            // Samsun merkez
            const samsunCenter = {lat: 41.2867, lng: 36.3308};
            
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: samsunCenter
            });
            
            // Haritaya tıklama event'i
            map.addListener('click', function(event) {
                const lat = event.latLng.lat();
                const lng = event.latLng.lng();
                
                // Input'ları güncelle
                document.getElementById('lat').value = lat;
                document.getElementById('lng').value = lng;
                
                // Marker'ı güncelle
                if (marker) {
                    marker.setMap(null);
                }
                
                marker = new google.maps.Marker({
                    position: {lat: lat, lng: lng},
                    map: map,
                    title: 'Seçilen Konum'
                });
                
                // Koordinat bilgisini göster
                document.getElementById('coordinateInfo').innerHTML = 
                    `<i class="fas fa-check text-success"></i> Seçildi: ${lat.toFixed(6)}, ${lng.toFixed(6)}`;
            });
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR-API-KEY&callback=initMap"></script>
</body>
</html>