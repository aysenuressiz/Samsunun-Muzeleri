<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yorum Yönetimi - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .comment-card {
            transition: transform 0.2s;
            border-left: 4px solid #ffc107;
        }
        .comment-card:hover {
            transform: translateY(-2px);
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
                               class="nav-link text-white">
                                <i class="fas fa-plus"></i> Müze Ekle
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin-yorumlar" 
                               class="nav-link text-white active">
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
                    <h2><i class="fas fa-comments"></i> Yorum Yönetimi</h2>
                    <span class="badge bg-warning fs-6">
                        ${bekleyenYorumlar.size()} bekleyen yorum
                    </span>
                </div>
                
                <!-- YENİ FİLTRE BÖLÜMÜ -->
				<div class="card mb-4">
   		 			<div class="card-header">
        				<h6><i class="fas fa-filter"></i> Filtreler ve İstatistikler</h6>
    				</div>
    			<div class="card-body">
        		<!-- İstatistikler -->
        		<div class="row mb-3">
            		<div class="col-md-4">
                		<div class="text-center p-2 bg-primary text-white rounded">
                    		<h5>${toplamYorum}</h5>
                    			<small>Toplam Yorum</small>
                		</div>
            		</div>
            		<div class="col-md-4">
                		<div class="text-center p-2 bg-warning text-dark rounded">
                    		<h5>${bekleyenYorum}</h5>
                    		<small>Bekleyen</small>
                		</div>
            		</div>
            		<div class="col-md-4">
                		<div class="text-center p-2 bg-success text-white rounded">
                    		<h5>${onayliYorum}</h5>
                    		<small>Onaylı</small>
                		</div>
            		</div>
        		</div>
        
        		
                <!-- Başarı/Hata Mesajları -->
                <c:if test="${param.sonuc == 'onaylandi'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle"></i> <strong>Başarılı!</strong> Yorum onaylandı ve sitede görünür hale geldi.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <c:if test="${param.sonuc == 'silindi'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle"></i> <strong>Başarılı!</strong> Yorum başarıyla silindi.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <c:if test="${param.hata != null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle"></i> Bir hata oluştu! Lütfen tekrar deneyin.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <!-- Bekleyen Yorumlar -->
                <div class="card">
                    <div class="card-header">
                        <h5><i class="fas fa-clock"></i> Onay Bekleyen Yorumlar</h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty bekleyenYorumlar}">
                                <div class="row">
                                    <c:forEach var="yorum" items="${bekleyenYorumlar}">
                                        <div class="col-lg-6 mb-4">
                                            <div class="card comment-card">
                                                <div class="card-header bg-warning bg-opacity-10">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div>
                                                            <h6 class="mb-1">
                                                                <i class="fas fa-user-circle"></i> 
                                                                <strong>${yorum.adSoyad}</strong>
                                                            </h6>
                                                            <small class="text-muted">
                                                                <i class="fas fa-envelope"></i> ${yorum.email}
                                                            </small>
                                                        </div>
                                                        <div class="text-end">
                                                            <small class="text-muted">
                                                                <i class="fas fa-calendar-alt"></i>
                                                                <fmt:formatDate value="${yorum.tarih}" pattern="dd.MM.yyyy HH:mm" />
                                                            </small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <p class="card-text">${yorum.yorum}</p>
                                                    
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <small class="text-muted">
                                                            <i class="fas fa-building"></i> 
                                                            Müze ID: ${yorum.muzeId}
                                                        </small>
                                                        
                                                        <div class="btn-group" role="group">
                                                            <form method="post" action="${pageContext.request.contextPath}/admin-yorum-islem" 
                                                                  style="display: inline;">
                                                                <input type="hidden" name="id" value="${yorum.id}">
                                                                <input type="hidden" name="islem" value="onayla">
                                                                <button type="submit" class="btn btn-success btn-sm" 
                                                                        title="Onayla">
                                                                    <i class="fas fa-check"></i> Onayla
                                                                </button>
                                                            </form>
                                                            
                                                            <button type="button" class="btn btn-danger btn-sm ms-1" 
                                                                    onclick="confirmDelete(${yorum.id}, '${yorum.adSoyad}')" 
                                                                    title="Sil">
                                                                <i class="fas fa-trash"></i> Sil
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5">
                                    <i class="fas fa-comments fa-3x text-success mb-3"></i>
                                    <h5 class="text-success">Harika! Bekleyen yorum yok</h5>
                                    <p class="text-muted">Tüm yorumlar onaylanmış veya henüz yeni yorum gelmemiş.</p>
                                    <a href="${pageContext.request.contextPath}/muzeler" class="btn btn-primary" target="_blank">
                                        <i class="fas fa-eye"></i> Siteyi Görüntüle
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                
                <!-- Bilgi Kutusu -->
                <div class="row mt-4">
                    <div class="col-lg-12">
                        <div class="card border-info">
                            <div class="card-header bg-info bg-opacity-10">
                                <h6><i class="fas fa-info-circle"></i> Yorum Yönetimi Hakkında</h6>
                            </div>
                            <div class="card-body">
                                <ul class="mb-0">
                                    <li><strong>Onaylanan yorumlar</strong> sitede hemen görünür hale gelir</li>
                                    <li><strong>Silinen yorumlar</strong> kalıcı olarak kaldırılır</li>
                                    <li>Yeni yorumlar <strong>varsayılan olarak onay bekler</strong></li>
                                    <li>Uygunsuz içerikli yorumları <strong>silmeyi</strong> unutmayın</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Silme Onay Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Yorum Silme Onayı</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p><strong id="deleteUserName"></strong> kullanıcısının yorumunu silmek istediğinizden emin misiniz?</p>
                    <p class="text-danger"><small>Bu işlem geri alınamaz!</small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    <form method="post" action="${pageContext.request.contextPath}/admin-yorum-islem" style="display: inline;">
                        <input type="hidden" name="id" id="deleteCommentId">
                        <input type="hidden" name="islem" value="sil">
                        <button type="submit" class="btn btn-danger">
                            <i class="fas fa-trash"></i> Sil
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete(id, userName) {
            document.getElementById('deleteCommentId').value = id;
            document.getElementById('deleteUserName').textContent = userName;
            new bootstrap.Modal(document.getElementById('deleteModal')).show();
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function filtrele() {
        const durum = document.getElementById('durumFiltre').value;
        const muze = document.getElementById('muzeFiltre').value;
        
        let url = '${pageContext.request.contextPath}/admin-yorumlar?';
        
        if (durum && durum !== 'tumu') {
            url += 'durum=' + durum;
        }
        
        if (muze && muze !== 'tumu') {
            if (url.includes('durum=')) {
                url += '&';
            }
            url += 'muze_id=' + muze;
        }
        
        window.location.href = url;
    }
    
    function sifirla() {
        window.location.href = '${pageContext.request.contextPath}/admin-yorumlar';
    }
    
    function confirmDelete(id, userName) {
        document.getElementById('deleteCommentId').value = id;
        document.getElementById('deleteUserName').textContent = userName;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
    }
</script>
</body>
</html>