package model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Transaksi {

    private int idTransaksi;
    private LocalDate tanggal;
    private BigDecimal jumlah;
    private String keterangan;
    private Kategori kategori;

    // WAJIB: constructor kosong TANPA EXCEPTION
    public Transaksi() {
    }

    // OPTIONAL: untuk keperluan tertentu (misal rekap)
    public Transaksi(LocalDate tanggal, BigDecimal jumlah) {
        this.tanggal = tanggal;
        this.jumlah = jumlah;
    }

    public int getIdTransaksi() {
        return idTransaksi;
    }

    public void setIdTransaksi(int idTransaksi) {
        this.idTransaksi = idTransaksi;
    }

    public LocalDate getTanggal() {
        return tanggal;
    }

    public void setTanggal(LocalDate tanggal) {
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
}
