package com.dao;

import com.model.AdminUser;
import com.model.Muze;
import com.util.DatabaseConnection;
import java.sql.*;

public class AdminDAO {
    
    public AdminUser adminGiris(String username, String password) throws SQLException {
        String sql = "SELECT * FROM admin_users WHERE username = ? AND password = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                AdminUser admin = new AdminUser();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setCreatedAt(rs.getTimestamp("created_at"));
                
                return admin;
            }
        }
        return null;
    }
    
    public boolean muzeEkle(Muze muze) throws SQLException {
        String sql = "INSERT INTO muzeler (ad, aciklama, adres, telefon, calisma_saatleri, calisma_gunleri, giris_ucreti, lat, lng, kapak_foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, muze.getAd());
            stmt.setString(2, muze.getAciklama());
            stmt.setString(3, muze.getAdres());
            stmt.setString(4, muze.getTelefon());
            stmt.setString(5, muze.getCalismaSaatleri());
            stmt.setString(6, muze.getCalismaGunleri());
            stmt.setString(7, muze.getGirisUcreti());
            stmt.setDouble(8, muze.getLat());
            stmt.setDouble(9, muze.getLng());
            stmt.setString(10, muze.getKapakFoto());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean muzeGuncelle(Muze muze) throws SQLException {
        String sql = "UPDATE muzeler SET ad = ?, aciklama = ?, adres = ?, telefon = ?, " +
                     "calisma_saatleri = ?, calisma_gunleri = ?, giris_ucreti = ?, " +
                     "lat = ?, lng = ?, kapak_foto = ? WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, muze.getAd());
            stmt.setString(2, muze.getAciklama());
            stmt.setString(3, muze.getAdres());
            stmt.setString(4, muze.getTelefon());
            stmt.setString(5, muze.getCalismaSaatleri());
            stmt.setString(6, muze.getCalismaGunleri());
            stmt.setString(7, muze.getGirisUcreti());
            stmt.setDouble(8, muze.getLat());
            stmt.setDouble(9, muze.getLng());
            stmt.setString(10, muze.getKapakFoto());
            stmt.setInt(11, muze.getId());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean muzeSil(int muzeId) throws SQLException {
        String sql = "DELETE FROM muzeler WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, muzeId);
            return stmt.executeUpdate() > 0;
        }
    }
    
    public Muze muzeGetirById(int id) throws SQLException {
        String sql = "SELECT * FROM muzeler WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Muze muze = new Muze();
                muze.setId(rs.getInt("id"));
                muze.setAd(rs.getString("ad"));
                muze.setAciklama(rs.getString("aciklama"));
                muze.setAdres(rs.getString("adres"));
                muze.setTelefon(rs.getString("telefon"));
                muze.setCalismaSaatleri(rs.getString("calisma_saatleri"));
                muze.setCalismaGunleri(rs.getString("calisma_gunleri"));
                muze.setGirisUcreti(rs.getString("giris_ucreti"));
                muze.setLat(rs.getDouble("lat"));
                muze.setLng(rs.getDouble("lng"));
                muze.setKapakFoto(rs.getString("kapak_foto"));
                
                return muze;
            }
        }
        return null;
    }
}