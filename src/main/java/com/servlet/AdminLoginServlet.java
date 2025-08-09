package com.servlet;

import com.dao.AdminDAO;
import com.model.AdminUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/admin-login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("hata", "Kullanıcı adı ve şifre gereklidir!");
            request.getRequestDispatcher("/jsp/admin-login.jsp").forward(request, response);
            return;
        }
        
        try {
            AdminUser admin = adminDAO.adminGiris(username.trim(), password);
            
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                session.setMaxInactiveInterval(30 * 60); // 30 dakika
                
                response.sendRedirect(request.getContextPath() + "/admin-dashboard");
            } else {
                request.setAttribute("hata", "Kullanıcı adı veya şifre hatalı!");
                request.getRequestDispatcher("/jsp/admin-login.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("hata", "Veritabanı hatası: " + e.getMessage());
            request.getRequestDispatcher("/jsp/admin-login.jsp").forward(request, response);
        }
    }
}