<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Müze Yönetimi - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
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
                               class="nav-link text-white active">
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
                    <h2><i class="fas fa-building"></i> Müze Yönetimi</h2>
                    <a href="${pageContext.request.contextPath}/admin-muze-ekle" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Yeni Müze Ekle
                    </a>
                </div>
                
                <!-- Başarı/Hata Mesajları -->
                <c:if test="${param.basari == 'eklendi'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle"></i> <strong>Başarılı!</strong> Müze başarıyla eklendi.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <c:if test="${param.basari == 'guncellendi'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle"></i> <strong>Başarılı!</strong> Müze başarıyla güncellendi.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                
                <!-- Müze Listesi -->
                <div class="card">
                    <div class="card-header">
                        <h5><i class="fas fa-list"></i> Müze Listesi (${muzeler.size()} müze)</h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty muzeler}">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Müze Adı</th>
                                                <th>Adres</th>
                                                <th>İşlemler</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="muze" items="${muzeler}">
                                                <tr>
                                                    <td><strong>${muze.id}</strong></td>
                                                    <td>
                                                        <div class="fw-bold">${muze.ad}</div>
                                                        <small class="text-muted">
                                                            <c:choose>
                                                                <c:when test="${muze.aciklama.length() > 50}">
                                                                    ${muze.aciklama.substring(0, 50)}...
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${muze.aciklama}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </small>
                                                    </td>
                                                    <td>${muze.adres}</td>
                                                    <td>
                                                        <div class="btn-group" role="group">
                                                            <a href="${pageContext.request.contextPath}/muze-detay?id=${muze.id}" 
                                                               class="btn btn-sm btn-info" target="_blank" title="Görüntüle">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="${pageContext.request.contextPath}/admin-muze-guncelle?id=${muze.id}" 
                                                               class="btn btn-sm btn-warning" title="Düzenle">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <button type="button" class="btn btn-sm btn-danger" 
                                                                    onclick="confirmDelete(${muze.id}, '${muze.ad}')" title="Sil">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5">
                                    <i class="fas fa-building fa-3x text-muted mb-3"></i>
                                    <h5 class="text-muted">Henüz müze eklenmemiş</h5>
                                    <a href="${pageContext.request.contextPath}/admin-muze-ekle" class="btn btn-primary">
                                        <i class="fas fa-plus"></i> İlk Müzeyi Ekle
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete(id, name) {
            if(confirm('Bu müzeyi silmek istediğinizden emin misiniz?\n\n' + name)) {
                // Silme işlemi için form gönder
                var form = document.createElement('form');
                form.method = 'post';
                form.action = '${pageContext.request.contextPath}/admin-muze-sil';
                
                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'id';
                input.value = id;
                
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>