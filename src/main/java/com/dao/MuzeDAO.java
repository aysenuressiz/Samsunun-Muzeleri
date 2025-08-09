package com.dao;

import com.model.Muze;
import com.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MuzeDAO {
    
    // Tüm müzeleri getir
    public List<Muze> tumMuzeler() throws SQLException {
        List<Muze> muzeler = new ArrayList<>();
        String sql = "SELECT * FROM muzeler ORDER BY ad";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Muze muze = createMuzeFromResultSet(rs);
                muzeler.add(muze);
            }
        }
        return muzeler;
    }
    
    // ID ile müze getir
    public Muze muzeGetirById(int id) throws SQLException {
        String sql = "SELECT * FROM muzeler WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return createMuzeFromResultSet(rs);
            }
        }
        return null;
    }
    
    // Öne çıkan müzeler (ilk 3)
    public List<Muze> oneCikanMuzeler() throws SQLException {
        List<Muze> muzeler = new ArrayList<>();
        String sql = "SELECT * FROM muzeler ORDER BY id LIMIT 3";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            
            while (rs.next()) {
                Muze muze = createMuzeFromResultSet(rs);
                muzeler.add(muze);
            }
        }
        
        return muzeler;
    }
    
    // Toplam müze sayısı
    public int toplamMuzeSayisi() throws SQLException {
        String sql = "SELECT COUNT(*) FROM muzeler";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    // ResultSet'ten Muze objesi oluştur
    private Muze createMuzeFromResultSet(ResultSet rs) throws SQLException {
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