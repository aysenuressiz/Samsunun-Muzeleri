package com.dao;

import com.model.Yorum;
import com.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class YorumDAO {
    
    public boolean yorumEkle(Yorum yorum) throws SQLException {
        String sql = "INSERT INTO yorumlar (muze_id, ad_soyad, email, yorum) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, yorum.getMuzeId());
            stmt.setString(2, yorum.getAdSoyad());
            stmt.setString(3, yorum.getEmail());
            stmt.setString(4, yorum.getYorum());
            
            return stmt.executeUpdate() > 0;
        }
    }
    
    public List<Yorum> muzeYorumlari(int muzeId) throws SQLException {
        List<Yorum> yorumlar = new ArrayList<>();
        String sql = "SELECT * FROM yorumlar WHERE muze_id = ? AND onaylandimi = TRUE ORDER BY tarih DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, muzeId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Yorum yorum = createYorumFromResultSet(rs);
                yorumlar.add(yorum);
            }
        }
        return yorumlar;
    }
    
    public List<Yorum> onaylanmamisYorumlar() throws SQLException {
        List<Yorum> yorumlar = new ArrayList<>();
        String sql = "SELECT * FROM yorumlar WHERE onaylandimi = FALSE ORDER BY tarih DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Yorum yorum = createYorumFromResultSet(rs);
                yorumlar.add(yorum);
            }
        }
        return yorumlar;
    }
    
    public boolean yorumOnayla(int yorumId) throws SQLException {
        String sql = "UPDATE yorumlar SET onaylandimi = TRUE WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, yorumId);
            return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean yorumSil(int yorumId) throws SQLException {
        String sql = "DELETE FROM yorumlar WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, yorumId);
            return stmt.executeUpdate() > 0;
        }
    }
    
    public int bekleyenYorumSayisi() throws SQLException {
        String sql = "SELECT COUNT(*) FROM yorumlar WHERE onaylandimi = FALSE";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    public int toplamYorumSayisi() throws SQLException {
        String sql = "SELECT COUNT(*) FROM yorumlar";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    private Yorum createYorumFromResultSet(ResultSet rs) throws SQLException {
        Yorum yorum = new Yorum();
        yorum.setId(rs.getInt("id"));
        yorum.setMuzeId(rs.getInt("muze_id"));
        yorum.setAdSoyad(rs.getString("ad_soyad"));
        yorum.setEmail(rs.getString("email"));
        yorum.setYorum(rs.getString("yorum"));
        yorum.setTarih(rs.getTimestamp("tarih"));
        yorum.setOnaylandimi(rs.getBoolean("onaylandimi"));
        return yorum;
    }
}