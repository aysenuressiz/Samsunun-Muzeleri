package com.servlet;

import com.dao.MuzeDAO;
import com.model.Muze;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/muzeler")
public class MuzelerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MuzeDAO muzeDAO = new MuzeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            List<Muze> tumMuzeler = muzeDAO.tumMuzeler();
            
            request.setAttribute("tumMuzeler", tumMuzeler);
            request.getRequestDispatcher("/jsp/muzeler.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Veritabanı hatası: " + e.getMessage());
        }
    }
}