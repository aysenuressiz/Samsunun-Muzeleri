package com.servlet;

import com.dao.MuzeDAO;
import com.dao.YorumDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MuzeDAO muzeDAO = new MuzeDAO();
    private YorumDAO yorumDAO = new YorumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login");
            return;
        }
        
        try {
            int toplamMuze = muzeDAO.toplamMuzeSayisi();
            int toplamYorum = yorumDAO.toplamYorumSayisi();
            int bekleyenYorum = yorumDAO.bekleyenYorumSayisi();
            
            request.setAttribute("toplamMuze", toplamMuze);
            request.setAttribute("toplamYorum", toplamYorum);
            request.setAttribute("bekleyenYorum", bekleyenYorum);
            
            request.getRequestDispatcher("/jsp/admin-dashboard.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Veritabanı hatası: " + e.getMessage());
        }
    }
}