package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/iletisim")
public class IletisimServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/jsp/iletisim.jsp").forward(request, response);
    }
}

@WebServlet("/iletisim-gonder")
class IletisimGonderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String adSoyad = request.getParameter("ad_soyad");
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String konu = request.getParameter("konu");
        String mesaj = request.getParameter("mesaj");
        
        if (adSoyad == null || adSoyad.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            konu == null || konu.trim().isEmpty() ||
            mesaj == null || mesaj.trim().isEmpty()) {
            
            request.setAttribute("hata", "Tüm gerekli alanları doldurunuz!");
            request.getRequestDispatcher("/jsp/iletisim.jsp").forward(request, response);
            return;
        }
        
        System.out.println("=== YENİ İLETİŞİM MESAJI ===");
        System.out.println("Ad Soyad: " + adSoyad);
        System.out.println("E-posta: " + email);
        System.out.println("Telefon: " + telefon);
        System.out.println("Konu: " + konu);
        System.out.println("Mesaj: " + mesaj);
        System.out.println("========================");
        
        response.sendRedirect(request.getContextPath() + "/iletisim?sonuc=basarili");
    }
}