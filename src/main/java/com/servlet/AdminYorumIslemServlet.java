package com.servlet;

import com.dao.YorumDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-yorum-islem")
public class AdminYorumIslemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private YorumDAO yorumDAO = new YorumDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Session kontrolü
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login");
            return;
        }
        
        String idStr = request.getParameter("id");
        String islem = request.getParameter("islem"); // "onayla" veya "sil"
        
        if (idStr == null || islem == null) {
            response.sendRedirect(request.getContextPath() + "/admin-yorumlar?hata=eksik_parametre");
            return;
        }
        
        try {
            int yorumId = Integer.parseInt(idStr);
            boolean basarili = false;
            String mesaj = "";
            
            if ("onayla".equals(islem)) {
                basarili = yorumDAO.yorumOnayla(yorumId);
                mesaj = basarili ? "onaylandi" : "onayla_hatasi";
            } else if ("sil".equals(islem)) {
                basarili = yorumDAO.yorumSil(yorumId);
                mesaj = basarili ? "silindi" : "sil_hatasi";
            }
            
            response.sendRedirect(request.getContextPath() + "/admin-yorumlar?sonuc=" + mesaj);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin-yorumlar?hata=gecersiz_id");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin-yorumlar?hata=veritabani");
        }
    }
}