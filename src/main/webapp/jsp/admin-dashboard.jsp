<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Samsun Müzeleri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .stat-card {
            transition: transform 0.2s;
        }
        .stat-card:hover {
            transform: translateY(-5px);
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
                               class="nav-link text-white active">
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
                    <h2><i class="fas fa-tachometer-alt"></i> Dashboard</h2>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary">
                        <i class="fas fa-external-link-alt"></i> Siteyi Görüntüle
                    </a>
                </div>
                
                <!-- İstatistik Kartları -->
                <div class="row mb-4">
                    <div class="col-md-4 mb-3">
                        <div class="card stat-card bg-primary text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3>${toplamMuze}</h3>
                                        <p class="mb-0">Toplam Müze</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-building fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-3">
                        <div class="card stat-card bg-success text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3>${toplamYorum}</h3>
                                        <p class="mb-0">Toplam Yorum</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-comments fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-3">
                        <div class="card stat-card bg-warning text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h3>${bekleyenYorum}</h3>
                                        <p class="mb-0">Bekleyen Yorum</p>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-clock fa-2x"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Hızlı Erişim -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5><i class="fas fa-bolt"></i> Hızlı Erişim</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin-muze-ekle" 
                                           class="btn btn-primary w-100">
                                            <i class="fas fa-plus"></i> Yeni Müze Ekle
                                        </a>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin-muzeler" 
                                           class="btn btn-info w-100">
                                            <i class="fas fa-list"></i> Müze Listesi
                                        </a>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <a href="${pageContext.request.contextPath}/admin-yorumlar" 
                                           class="btn btn-warning w-100">
                                            <i class="fas fa-comments"></i> Yorumları Yönet
                                        </a>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <a href="${pageContext.request.contextPath}/" 
                                           class="btn btn-success w-100" target="_blank">
                                            <i class="fas fa-eye"></i> Siteyi Görüntüle
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>