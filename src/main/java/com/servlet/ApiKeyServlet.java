package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/api-key")
public class ApiKeyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Environment variable'dan API key'i al
        String apiKey = System.getenv("GOOGLE_MAPS_API_KEY");
        
        // Eğer environment variable yoksa, default değer kullan
        if (apiKey == null || apiKey.trim().isEmpty()) {
            apiKey = "YOUR-API-KEY"; // Bu sadece local development için
        }
        
        // API key'i döndür
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(apiKey);
    }
}
