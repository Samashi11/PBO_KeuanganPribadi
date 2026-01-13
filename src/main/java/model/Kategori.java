package model;

public class Kategori {

    private int idKategori;
    private String namaKategori;
    private String tipe; // PEMASUKAN / PENGELUARAN

    // 🔴 TAMBAHAN (WAJIB sesuai DB)
    private int idUser;

    // Constructor kosong (WAJIB buat JavaBean)
    public Kategori() {
    }

    // Constructor lama (JANGAN DIHAPUS)
    public Kategori(int idKategori, String namaKategori, String tipe) {
        this.idKategori = idKategori;
        this.namaKategori = namaKategori;
        this.tipe = tipe;
    }

    // 🔴 Constructor tambahan (opsional, tapi sehat)
    public Kategori(int idKategori, String namaKategori, String tipe, int idUser) {
        this.idKategori = idKategori;
        this.namaKategori = namaKategori;
        this.tipe = tipe;
        this.idUser = idUser;
    }

    // Getter & Setter existing
    public int getIdKategori() {
        return idKategori;
    }

    public void setIdKategori(int idKategori) {
        this.idKategori = idKategori;
    }

    public String getNamaKategori() {
        return namaKategori;
    }

    public void setNamaKategori(String namaKategori) {
        this.namaKategori = namaKategori;
    }

    public String getTipe() {
        return tipe;
    }

    public void setTipe(String tipe) {
        this.tipe = tipe;
    }

    // 🔴 Getter & Setter tambahan
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
