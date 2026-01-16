package dao;

import model.Transaksi;
import model.Kategori;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import static util.KoneksiDB.getConnection;

public class TransaksiDAO {

    // ==========================================
    // 1. LIHAT SEMUA DATA (READ ALL)
    // ==========================================
    public List<Transaksi> findAll() {
        List<Transaksi> list = new ArrayList<>();

        String sql = "SELECT t.id_transaksi, t.tanggal, t.jumlah, t.keterangan, "
                + "k.id_kategori, k.nama_kategori, k.tipe "
                + "FROM transaksi t "
                + "JOIN kategori k ON t.id_kategori = k.id_kategori "
                + "ORDER BY t.tanggal DESC";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Kategori kategori = new Kategori(
                        rs.getInt("id_kategori"),
                        rs.getString("nama_kategori"),
                        rs.getString("tipe")
                );

                Transaksi t = new Transaksi();
                t.setIdTransaksi(rs.getInt("id_transaksi"));
                t.setTanggal(rs.getDate("tanggal"));
                t.setJumlah(rs.getBigDecimal("jumlah"));
                t.setKeterangan(rs.getString("keterangan"));
                t.setKategori(kategori);

                list.add(t);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ==========================================
    // 2. LIHAT DATA BY USER ID
    // ==========================================
    public List<Transaksi> findByUserId(int idUser) {
        List<Transaksi> list = new ArrayList<>();

        String sql = "SELECT "
                + "  t.id_transaksi, "
                + "  t.tanggal, "
                + "  t.jumlah, "
                + "  t.keterangan, "
                + "  k.id_kategori, "
                + "  k.nama_kategori, "
                + "  k.tipe "
                + "FROM transaksi t "
                + "JOIN kategori k ON t.id_kategori = k.id_kategori "
                + "WHERE t.id_user = ? "
                + "ORDER BY t.tanggal DESC";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUser);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {

                    Kategori k = new Kategori();
                    k.setIdKategori(rs.getInt("id_kategori"));
                    k.setNamaKategori(rs.getString("nama_kategori"));
                    k.setTipe(rs.getString("tipe"));

                    Transaksi t = new Transaksi();
                    t.setIdTransaksi(rs.getInt("id_transaksi"));
                    t.setTanggal(rs.getDate("tanggal"));
                    t.setJumlah(rs.getBigDecimal("jumlah"));
                    t.setKeterangan(rs.getString("keterangan"));
                    t.setKategori(k);

                    list.add(t);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ==========================================
    // 3. MENCARI DATA BERDASARKAN ID (UNTUK EDIT)
    // ==========================================
    public Transaksi findById(int id) {
        String sql = "SELECT t.*, k.nama_kategori, k.tipe FROM transaksi t "
                + "JOIN kategori k ON t.id_kategori = k.id_kategori "
                + "WHERE t.id_transaksi = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Mapping data DB ke Object Java
                    Kategori k = new Kategori();
                    k.setIdKategori(rs.getInt("id_kategori"));
                    k.setNamaKategori(rs.getString("nama_kategori"));
                    k.setTipe(rs.getString("tipe"));

                    Transaksi t = new Transaksi();
                    t.setIdTransaksi(rs.getInt("id_transaksi"));
                    t.setTanggal(rs.getDate("tanggal"));
                    t.setJumlah(rs.getBigDecimal("jumlah"));
                    t.setKeterangan(rs.getString("keterangan"));
                    t.setKategori(k);
                    return t;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Kalau data ga ketemu
    }

    // ==========================================
    // 4. HITUNG TOTAL DATA
    // ==========================================
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM transaksi";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int countByUserId(int idUser) {
        String sql = "SELECT COUNT(*) FROM transaksi WHERE id_user = ?";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUser);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    // ==========================================
    // 5. TAMBAH DATA (CREATE)
    // ==========================================
    public void insert(Transaksi t) {
        // Query disesuaikan dengan kolom di tabel transaksi kamu
        String sql = "INSERT INTO transaksi (tanggal, jumlah, keterangan, id_kategori, id_user) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, t.getTanggal());
            ps.setBigDecimal(2, t.getJumlah());
            ps.setString(3, t.getKeterangan());
            ps.setInt(4, t.getKategori().getIdKategori());
            ps.setInt(5, t.getIdUser());

            AnggaranDAO anggaranDAO = new AnggaranDAO();
            anggaranDAO.kurangiAnggaran(
                    t.getKategori().getIdKategori(),
                    t.getIdUser(),
                    t.getJumlah()
            );

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ==========================================
    // 6. UPDATE DATA (EDIT)
    // ==========================================
    public void update(Transaksi t) {
        String sql = "UPDATE transaksi SET tanggal=?, jumlah=?, keterangan=?, id_kategori=? "
                + "WHERE id_transaksi=?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, t.getTanggal());
            ps.setBigDecimal(2, t.getJumlah());
            ps.setString(3, t.getKeterangan());
            ps.setInt(4, t.getKategori().getIdKategori());
            ps.setInt(5, t.getIdTransaksi()); // ID untuk WHERE clause

            ps.executeUpdate();
            System.out.println("✅ Berhasil update ID: " + t.getIdTransaksi());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ==========================================
    // 7. HAPUS DATA (DELETE)
    // ==========================================
    public void delete(int id) {
        // ⚠️ Menggunakan id_transaksi sesuai database
        String sql = "DELETE FROM transaksi WHERE id_transaksi = ?";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            int barisTerhapus = stmt.executeUpdate();

            // Cek di Output Netbeans
            if (barisTerhapus > 0) {
                System.out.println("✅ Sukses menghapus ID: " + id);
            } else {
                System.out.println("❌ Gagal hapus. ID " + id + " tidak ditemukan di database.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

//test
