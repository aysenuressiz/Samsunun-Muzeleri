package com.servlet;

import com.dao.MuzeDAO;
import com.model.Muze;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class AnasayfaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MuzeDAO muzeDAO = new MuzeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        
        
        try {
            // Öne çıkan müzeleri getir (ilk 3 müze)
            List<Muze> oneCikanMuzeler = muzeDAO.oneCikanMuzeler();
            
            // JSP'ye gönder
            request.setAttribute("oneCikanMuzeler", oneCikanMuzeler);
            
            // JSP'ye yönlendir
            request.getRequestDispatcher("/jsp/anasayfa.jsp").forward(request, response);
            
        } catch (SQLException e) {
            System.out.println("Servlet SQL HATASI: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Veritabanı hatası: " + e.getMessage());
        }
        
      
    }
}