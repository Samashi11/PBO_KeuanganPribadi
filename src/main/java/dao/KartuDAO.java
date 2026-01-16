package dao;

import model.Kartu;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KartuDAO {

    // Tambah kartu baru
    public boolean insert(Kartu kartu) {
        String sql = "INSERT INTO kartu (id_user, jenis_kartu, nama_kartu, nomor_kartu_masked, nama_pemilik, bank, tanggal_exp) VALUES (?, ?, ?, ?, ?, ?, ?)";
        // ... (isi sama seperti di jawaban sebelumnya)
    }

    // Ambil kartu milik user
    public List<Kartu> findByUserId(int idUser) {
        List<Kartu> list = new ArrayList<>();
        String sql = "SELECT * FROM kartu WHERE id_user = ? AND is_active = true ORDER BY created_at DESC";
        // ... (isi sama seperti di jawaban sebelumnya)
    }

    // Hapus kartu (soft delete)
    public boolean softDelete(int idKartu, int idUser) {
        String sql = "UPDATE kartu SET is_active = false WHERE id_kartu=? AND id_user=?";
        // ... (isi sama seperti di jawaban sebelumnya)
    }
}