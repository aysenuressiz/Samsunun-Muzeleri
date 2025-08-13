package com.servlet;

import com.dao.AdminDAO;
import com.dao.YorumDAO;
import com.model.Muze;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/admin-muze-guncelle")
@MultipartConfig(
            fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 15
)
public class AdminMuzeGuncelleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();
    private YorumDAO yorumDAO = new YorumDAO();
    
    // İzin verilen dosya türleri
    private static final String[] ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif"};
    
    // Dosya yükleme klasörü
    private static final String UPLOAD_DIR = "images" + File.separator + "muzeler" + File.separator + "kapak";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Session kontrolü
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login");
            return;
        }
        
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=eksik_id");
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            Muze muze = adminDAO.muzeGetirById(id);
            int bekleyenYorum = yorumDAO.bekleyenYorumSayisi();
            
            if (muze == null) {
                response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=muze_bulunamadi");
                return;
            }
            
            request.setAttribute("muze", muze);
            request.setAttribute("bekleyenYorum", bekleyenYorum);
            request.getRequestDispatcher("/jsp/admin-muze-guncelle.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=gecersiz_id");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=veritabani");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // Session kontrolü
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login");
            return;
        }
        
        // Form verilerini al
        String idStr = request.getParameter("id");
        String ad = request.getParameter("ad");
        String aciklama = request.getParameter("aciklama");
        String adres = request.getParameter("adres");
        String telefon = request.getParameter("telefon");
        String calismaSaatleri = request.getParameter("calisma_saatleri");
        String calismaGunleri = request.getParameter("calisma_gunleri");
        String girisUcreti = request.getParameter("giris_ucreti");
        String latStr = request.getParameter("lat");
        String lngStr = request.getParameter("lng");
        String mevcutFoto = request.getParameter("mevcut_kapak_foto");
        
        // Dosya yükleme
        Part filePart = request.getPart("kapak_foto");
        String fileName = mevcutFoto; // Mevcut fotoğrafı koru
        
        // Basit doğrulama
        if (idStr == null || ad == null || ad.trim().isEmpty() ||
            aciklama == null || aciklama.trim().isEmpty() ||
            adres == null || adres.trim().isEmpty()) {
            
            request.setAttribute("hata", "ID, ad, açıklama ve adres alanları zorunludur!");
            doGet(request, response);
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            double lat = Double.parseDouble(latStr);
            double lng = Double.parseDouble(lngStr);
            
            // Yeni dosya yüklendiyse işle
            if (filePart != null && filePart.getSize() > 0) {
                String newFileName = uploadFile(filePart, request);
                if (newFileName != null) {
                    // Eski dosyayı sil (default değilse)
                    if (mevcutFoto != null && !mevcutFoto.equals("default-museum.jpg")) {
                        deleteOldFile(mevcutFoto, request);
                    }
                    fileName = newFileName;
                } else {
                    request.setAttribute("hata", "Dosya yükleme hatası! Sadece JPG, PNG, GIF dosyaları kabul edilir.");
                    doGet(request, response);
                    return;
                }
            }
            
            Muze muze = new Muze();
            muze.setId(id);
            muze.setAd(ad.trim());
            muze.setAciklama(aciklama.trim());
            muze.setAdres(adres.trim());
            muze.setTelefon(telefon != null ? telefon.trim() : "");
            muze.setCalismaSaatleri(calismaSaatleri != null ? calismaSaatleri.trim() : "");
            muze.setCalismaGunleri(calismaGunleri != null ? calismaGunleri.trim() : "");
            muze.setGirisUcreti(girisUcreti != null ? girisUcreti.trim() : "");
            muze.setLat(lat);
            muze.setLng(lng);
            muze.setKapakFoto(fileName);
            
            boolean basarili = adminDAO.muzeGuncelle(muze);
            
            if (basarili) {
                response.sendRedirect(request.getContextPath() + "/admin-muzeler?basari=guncellendi");
            } else {
                request.setAttribute("hata", "Müze güncellenirken bir hata oluştu!");
                doGet(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("hata", "ID veya koordinat bilgileri geçersiz!");
            doGet(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("hata", "Veritabanı hatası: " + e.getMessage());
            doGet(request, response);
        }
    }
    
    private String uploadFile(Part filePart, HttpServletRequest request) {
        try {
            String originalFileName = getFileName(filePart);
            if (originalFileName == null || originalFileName.isEmpty()) {
                return null;
            }
            
            // Dosya uzantısını kontrol et
            String fileExtension = getFileExtension(originalFileName).toLowerCase();
            if (!isAllowedExtension(fileExtension)) {
                return null;
            }
            
            // Benzersiz dosya adı oluştur
            String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
            
            // Yükleme klasörünün yolunu al
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
            
            // Klasör yoksa oluştur
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            // Dosyayı kaydet
            String filePath = uploadPath + File.separator + uniqueFileName;
            filePart.write(filePath);
            
            System.out.println("Dosya güncellendi: " + filePath);
            return uniqueFileName;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    private void deleteOldFile(String fileName, HttpServletRequest request) {
        try {
            String applicationPath = request.getServletContext().getRealPath("");
            String filePath = applicationPath + File.separator + UPLOAD_DIR + File.separator + fileName;
            
            File file = new File(filePath);
            if (file.exists() && file.delete()) {
                System.out.println("Eski dosya silindi: " + filePath);
            }
        } catch (Exception e) {
            System.err.println("Eski dosya silinemedi: " + e.getMessage());
        }
    }
    
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            String[] tokens = contentDisp.split(";");
            for (String token : tokens) {
                if (token.trim().startsWith("filename")) {
                    String fileName = token.substring(token.indexOf("=") + 2, token.length() - 1);
                    return fileName.isEmpty() ? null : fileName;
                }
            }
        }
        return null;
    }
    
    private String getFileExtension(String fileName) {
        int lastIndexOf = fileName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return "";
        }
        return fileName.substring(lastIndexOf);
    }
    
    private boolean isAllowedExtension(String extension) {
        for (String allowed : ALLOWED_EXTENSIONS) {
            if (allowed.equals(extension)) {
                return true;
            }
        }
        return false;
    }
}