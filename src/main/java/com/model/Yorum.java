package com.model;

import java.sql.Timestamp;

public class Yorum {
    private int id;
    private int muzeId;
    private String adSoyad;
    private String email;
    private String yorum;
    private Timestamp tarih;
    private boolean onaylandimi;

    // Constructors
    public Yorum() {}

    public Yorum(int muzeId, String adSoyad, String email, String yorum) {
        this.muzeId = muzeId;
        this.adSoyad = adSoyad;
        this.email = email;
        this.yorum = yorum;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getMuzeId() { return muzeId; }
    public void setMuzeId(int muzeId) { this.muzeId = muzeId; }

    public String getAdSoyad() { return adSoyad; }
    public void setAdSoyad(String adSoyad) { this.adSoyad = adSoyad; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getYorum() { return yorum; }
    public void setYorum(String yorum) { this.yorum = yorum; }

    public Timestamp getTarih() { return tarih; }
    public void setTarih(Timestamp tarih) { this.tarih = tarih; }

    public boolean isOnaylandimi() { return onaylandimi; }
    public void setOnaylandimi(boolean onaylandimi) { this.onaylandimi = onaylandimi; }
}