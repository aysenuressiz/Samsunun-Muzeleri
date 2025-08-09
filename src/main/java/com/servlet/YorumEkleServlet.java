package com.servlet;

import com.dao.YorumDAO;
import com.model.Yorum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/yorum-ekle")
public class YorumEkleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private YorumDAO yorumDAO = new YorumDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // Form verilerini al
        String muzeIdStr = request.getParameter("muze_id");
        String adSoyad = request.getParameter("ad_soyad");
        String email = request.getParameter("email");
        String yorumMetni = request.getParameter("yorum");
        
        // Basit doğrulama
        if (muzeIdStr == null || adSoyad == null || adSoyad.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            yorumMetni == null || yorumMetni.trim().isEmpty()) {
            
            response.sendRedirect(request.getContextPath() + "/muze-detay?id=" + muzeIdStr + "&hata=eksik_bilgi");
            return;
        }
        
        try {
            int muzeId = Integer.parseInt(muzeIdStr);
            
            // Yorum objesi oluştur
            Yorum yorum = new Yorum();
            yorum.setMuzeId(muzeId);
            yorum.setAdSoyad(adSoyad.trim());
            yorum.setEmail(email.trim());
            yorum.setYorum(yorumMetni.trim());
            
            // Veritabanına ekle
            boolean basarili = yorumDAO.yorumEkle(yorum);
            
            if (basarili) {
                response.sendRedirect(request.getContextPath() + "/muze-detay?id=" + muzeId + "&sonuc=basarili");
            } else {
                response.sendRedirect(request.getContextPath() + "/muze-detay?id=" + muzeId + "&hata=kayit_hatasi");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/muzeler");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/muze-detay?id=" + muzeIdStr + "&hata=veritabani");
        }
    }
}