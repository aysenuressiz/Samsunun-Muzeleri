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

@WebServlet("/admin-muze-ekle")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 15     // 15 MB
)
public class AdminMuzeEkleServlet extends HttpServlet {
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
        
        try {
            int bekleyenYorum = yorumDAO.bekleyenYorumSayisi();
            request.setAttribute("bekleyenYorum", bekleyenYorum);
        } catch (SQLException e) {
            request.setAttribute("bekleyenYorum", 0);
        }
        
        request.getRequestDispatcher("/jsp/admin-muze-ekle.jsp").forward(request, response);
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
        String ad = request.getParameter("ad");
        String aciklama = request.getParameter("aciklama");
        String adres = request.getParameter("adres");
        String telefon = request.getParameter("telefon");
        String calismaSaatleri = request.getParameter("calisma_saatleri");
        String calismaGunleri = request.getParameter("calisma_gunleri");
        String girisUcreti = request.getParameter("giris_ucreti");
        String latStr = request.getParameter("lat");
        String lngStr = request.getParameter("lng");
        
        // Dosya yükleme
        Part filePart = request.getPart("kapak_foto");
        //String fileName = "default-museum.jpg"; // Varsayılan
        
        // Basit doğrulama
        if (ad == null || ad.trim().isEmpty() ||
            aciklama == null || aciklama.trim().isEmpty() ||
            adres == null || adres.trim().isEmpty()) {
            
            request.setAttribute("hata", "Ad, açıklama ve adres alanları zorunludur!");
            doGet(request, response);
            return;
        }
        
        try {
            double lat = Double.parseDouble(latStr);
            double lng = Double.parseDouble(lngStr);
            String fileName = null;

            // Dosya yükleme işlemi
            if (filePart != null && filePart.getSize() > 0) {
                fileName = uploadFile(filePart, request);
                if (fileName == null) {
                    request.setAttribute("hata", "Dosya yükleme hatası! Sadece JPG, PNG, GIF dosyaları kabul edilir.");
                    doGet(request, response);
                    return;
                }
            }
            
            Muze muze = new Muze();
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
            
            boolean basarili = adminDAO.muzeEkle(muze);
            
            if (basarili) {
                response.sendRedirect(request.getContextPath() + "/admin-muzeler?basari=eklendi");
            } else {
                request.setAttribute("hata", "Müze eklenirken bir hata oluştu!");
                doGet(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("hata", "Koordinat bilgileri geçersiz!");
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
            
            System.out.println("Dosya yüklendi: " + filePath);
            return uniqueFileName;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
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