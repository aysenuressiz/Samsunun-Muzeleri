package com.model;

public class Muze {
    private int id;
    private String ad;
    private String aciklama;
    private String adres;
    private String telefon;
    private String calismaSaatleri;
    private String calismaGunleri;
    private String girisUcreti;
    private double lat;
    private double lng;
    private String kapakFoto;

    public Muze() {}

    public Muze(String ad, String aciklama, String adres, double lat, double lng) {
        this.ad = ad;
        this.aciklama = aciklama;
        this.adres = adres;
        this.lat = lat;
        this.lng = lng;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getAd() { return ad; }
    public void setAd(String ad) { this.ad = ad; }

    public String getAciklama() { return aciklama; }
    public void setAciklama(String aciklama) { this.aciklama = aciklama; }

    public String getAdres() { return adres; }
    public void setAdres(String adres) { this.adres = adres; }

    public String getTelefon() { return telefon; }
    public void setTelefon(String telefon) { this.telefon = telefon; }

    public String getCalismaSaatleri() { return calismaSaatleri; }
    public void setCalismaSaatleri(String calismaSaatleri) { this.calismaSaatleri = calismaSaatleri; }

    public String getCalismaGunleri() { return calismaGunleri; }
    public void setCalismaGunleri(String calismaGunleri) { this.calismaGunleri = calismaGunleri; }

    public String getGirisUcreti() { return girisUcreti; }
    public void setGirisUcreti(String girisUcreti) { this.girisUcreti = girisUcreti; }

    public double getLat() { return lat; }
    public void setLat(double lat) { this.lat = lat; }

    public double getLng() { return lng; }
    public void setLng(double lng) { this.lng = lng; }

    public String getKapakFoto() { return kapakFoto; }
    public void setKapakFoto(String kapakFoto) { this.kapakFoto = kapakFoto; }
}