package com.servlet;

import com.dao.MuzeDAO;
import com.dao.YorumDAO;
import com.model.Muze;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin-muzeler")
public class AdminMuzelerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MuzeDAO muzeDAO = new MuzeDAO();
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
            List<Muze> muzeler = muzeDAO.tumMuzeler();
            int bekleyenYorum = yorumDAO.bekleyenYorumSayisi();
            
            request.setAttribute("muzeler", muzeler);
            request.setAttribute("bekleyenYorum", bekleyenYorum);
            request.getRequestDispatcher("/jsp/admin-muzeler.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Veritabanı hatası: " + e.getMessage());
        }
    }
}