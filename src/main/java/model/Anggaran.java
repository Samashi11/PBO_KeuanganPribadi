/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Anggaran {

    private int idAnggaran;
    private Kategori kategori;
    private BigDecimal jumlahAnggaran;
    private BigDecimal sisaAnggaran;

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
    
    public int getPersentaseTerpakai() {
    if (jumlahAnggaran == null || sisaAnggaran == null) return 0;

    BigDecimal terpakai = jumlahAnggaran.subtract(sisaAnggaran);

    return terpakai
        .multiply(new BigDecimal(100))
        .divide(jumlahAnggaran, 0, RoundingMode.HALF_UP)
        .intValue();
    }

}

