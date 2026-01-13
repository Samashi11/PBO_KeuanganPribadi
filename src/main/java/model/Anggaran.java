package model;

import java.math.BigDecimal;

public class Anggaran {

    private int idAnggaran;
    private Kategori kategori;
    private BigDecimal jumlahAnggaran;
    private BigDecimal sisaAnggaran;

    // 🔴 TAMBAHAN (WAJIB secara domain)
    private int idUser;

    public Anggaran() {
    }

    public Anggaran(int idAnggaran, Kategori kategori,
            BigDecimal jumlahAnggaran, BigDecimal sisaAnggaran) {
        this.idAnggaran = idAnggaran;
        this.kategori = kategori;
        this.jumlahAnggaran = jumlahAnggaran;
        this.sisaAnggaran = sisaAnggaran;
    }

    // 🔴 constructor tambahan (opsional tapi sehat)
    public Anggaran(int idAnggaran, Kategori kategori,
            BigDecimal jumlahAnggaran, BigDecimal sisaAnggaran,
            int idUser) {
        this.idAnggaran = idAnggaran;
        this.kategori = kategori;
        this.jumlahAnggaran = jumlahAnggaran;
        this.sisaAnggaran = sisaAnggaran;
        this.idUser = idUser;
    }

    public int getIdAnggaran() {
        return idAnggaran;
    }

    public void setIdAnggaran(int idAnggaran) {
        this.idAnggaran = idAnggaran;
    }

    public Kategori getKategori() {
        return kategori;
    }

    public void setKategori(Kategori kategori) {
        this.kategori = kategori;
    }

    public BigDecimal getJumlahAnggaran() {
        return jumlahAnggaran;
    }

    public void setJumlahAnggaran(BigDecimal jumlahAnggaran) {
        this.jumlahAnggaran = jumlahAnggaran;
    }

    public BigDecimal getSisaAnggaran() {
        return sisaAnggaran;
    }

    public void setSisaAnggaran(BigDecimal sisaAnggaran) {
        this.sisaAnggaran = sisaAnggaran;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
