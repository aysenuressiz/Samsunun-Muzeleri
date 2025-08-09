package com.servlet;

import com.dao.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-muze-sil")
public class AdminMuzeSilServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();

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
        
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=eksik_id");
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            boolean basarili = adminDAO.muzeSil(id);
            
            if (basarili) {
                response.sendRedirect(request.getContextPath() + "/admin-muzeler?basari=silindi");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=silinemedi");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=gecersiz_id");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin-muzeler?hata=veritabani");
        }
    }
}