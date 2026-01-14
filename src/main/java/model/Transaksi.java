package model;

import java.math.BigDecimal;
import java.sql.Date;

public class Transaksi {

    private int idTransaksi;
    private Date tanggal;
    private BigDecimal jumlah;
    private String keterangan;
    private Kategori kategori;
    private int idUser;

    public Transaksi() {
    }

    public Transaksi(int idTransaksi, Date tanggal, BigDecimal jumlah,
            String keterangan, Kategori kategori) {
        this.idTransaksi = idTransaksi;
        this.tanggal = tanggal;
        this.jumlah = jumlah;
        this.keterangan = keterangan;
        this.kategori = kategori;
    }

    public Transaksi(int idTransaksi, Date tanggal, BigDecimal jumlah,
            String keterangan, Kategori kategori, int idUser) {
        this.idTransaksi = idTransaksi;
        this.tanggal = tanggal;
        this.jumlah = jumlah;
        this.keterangan = keterangan;
        this.kategori = kategori;
        this.idUser = idUser;
    }

    public int getIdTransaksi() {
        return idTransaksi;
    }

    public void setIdTransaksi(int idTransaksi) {
        this.idTransaksi = idTransaksi;
    }

    // ==========================================================
    // 👇 INI YANG DITAMBAHKAN (ALIAS)
    // Supaya ${t.id} di JSP bisa baca data idTransaksi
    // ==========================================================
    public int getId() {
        return idTransaksi;
    }
    // ==========================================================

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    public BigDecimal getJumlah() {
        return jumlah;
    }

    public void setJumlah(BigDecimal jumlah) {
        this.jumlah = jumlah;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public Kategori getKategori() {
        return kategori;
    }

    public void setKategori(Kategori kategori) {
        this.kategori = kategori;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    // Alias untuk Deskripsi (yang kamu buat sebelumnya)
    public String getDeskripsi() {
        return this.keterangan;
    }
}