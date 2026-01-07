package model;

import java.math.BigDecimal;
import java.sql.Date;

public class Transaksi {

    private int idTransaksi;
    private Date tanggal;
    private BigDecimal jumlah;
    private String keterangan;
    private Kategori kategori;

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

    public int getIdTransaksi() {
        return idTransaksi;
    }

    public void setIdTransaksi(int idTransaksi) {
        this.idTransaksi = idTransaksi;
    }

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

    public void setDeskripsi(String keterangan) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
