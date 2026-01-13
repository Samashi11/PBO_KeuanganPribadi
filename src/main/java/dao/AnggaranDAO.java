package dao;

import model.Anggaran;
import model.Kategori;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnggaranDAO {

    public List<Anggaran> findAll() {
        List<Anggaran> list = new ArrayList<>();

        String sql = "SELECT a.id_anggaran, a.jumlah_anggaran, a.sisa_anggaran, "
                + "k.id_kategori, k.nama_kategori, k.tipe "
                + "FROM anggaran a "
                + "JOIN kategori k ON a.id_kategori = k.id_kategori "
                + "ORDER BY k.nama_kategori";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Kategori k = new Kategori();
                k.setIdKategori(rs.getInt("id_kategori"));
                k.setNamaKategori(rs.getString("nama_kategori"));
                k.setTipe(rs.getString("tipe"));

                Anggaran a = new Anggaran();
                a.setIdAnggaran(rs.getInt("id_anggaran"));
                a.setJumlahAnggaran(rs.getBigDecimal("jumlah_anggaran"));
                a.setSisaAnggaran(rs.getBigDecimal("sisa_anggaran"));

                // INI BARIS KRITIS
                a.setKategori(k);

                list.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Anggaran> findByUserId(int idUser) {
        List<Anggaran> list = new ArrayList<>();

        String sql
                = "SELECT "
                + "  a.id_anggaran, "
                + "  a.jumlah_anggaran, "
                + "  a.sisa_anggaran, "
                + "  k.id_kategori, "
                + "  k.nama_kategori, "
                + "  k.tipe "
                + "FROM anggaran a "
                + "JOIN kategori k ON a.id_kategori = k.id_kategori "
                + "WHERE a.id_user = ? "
                + "ORDER BY k.nama_kategori";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUser);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {

                    Kategori k = new Kategori();
                    k.setIdKategori(rs.getInt("id_kategori"));
                    k.setNamaKategori(rs.getString("nama_kategori"));
                    k.setTipe(rs.getString("tipe"));

                    Anggaran a = new Anggaran();
                    a.setIdAnggaran(rs.getInt("id_anggaran"));
                    a.setJumlahAnggaran(rs.getBigDecimal("jumlah_anggaran"));
                    a.setSisaAnggaran(rs.getBigDecimal("sisa_anggaran"));
                    a.setKategori(k);

                    list.add(a);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int countAll() {
        String sql = "SELECT COUNT(*) FROM anggaran";

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
        String sql = "SELECT COUNT(*) FROM anggaran WHERE id_user = ?";

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
}
