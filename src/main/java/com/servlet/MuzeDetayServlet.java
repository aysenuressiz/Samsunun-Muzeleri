package com.servlet;

import com.dao.MuzeDAO;
import com.dao.YorumDAO;
import com.model.Muze;
import com.model.Yorum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/muze-detay")
public class MuzeDetayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MuzeDAO muzeDAO = new MuzeDAO();
    private YorumDAO yorumDAO = new YorumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/muzeler");
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            
            // Müze bilgilerini getir
            Muze muze = muzeDAO.muzeGetirById(id);
            if (muze == null) {
                response.sendRedirect(request.getContextPath() + "/muzeler");
                return;
            }
            
            // Müzeye ait onaylı yorumları getir
            List<Yorum> yorumlar = yorumDAO.muzeYorumlari(id);
            
            // JSP'ye gönder
            request.setAttribute("muze", muze);
            request.setAttribute("yorumlar", yorumlar);
            request.getRequestDispatcher("/jsp/muze-detay.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/muzeler");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Veritabanı hatası: " + e.getMessage());
        }
    }
}