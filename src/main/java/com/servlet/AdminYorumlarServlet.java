package com.servlet;

import com.dao.YorumDAO;
import com.model.Yorum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin-yorumlar")
public class AdminYorumlarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private YorumDAO yorumDAO = new YorumDAO();

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
            List<Yorum> bekleyenYorumlar = yorumDAO.onaylanmamisYorumlar();
            int bekleyenYorum = yorumDAO.bekleyenYorumSayisi();
            int toplamYorum = yorumDAO.toplamYorumSayisi();
            int onayliYorum = toplamYorum - bekleyenYorum;
            
            request.setAttribute("bekleyenYorumlar", bekleyenYorumlar);
            request.setAttribute("bekleyenYorum", bekleyenYorum);
            request.setAttribute("toplamYorum", toplamYorum);
            request.setAttribute("onayliYorum", onayliYorum);
            
            request.getRequestDispatcher("/jsp/admin-yorumlar.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Veritabanı hatası: " + e.getMessage());
        }
    }
}