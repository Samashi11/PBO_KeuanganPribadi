package dao;

import model.Transaksi;
import model.Kategori;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransaksiDAO {

    public List<Transaksi> findAll() {
        List<Transaksi> list = new ArrayList<>();

        String sql = "SELECT t.id_transaksi, t.tanggal, t.jumlah, t.keterangan, " +
                     "k.id_kategori, k.nama_kategori, k.tipe " +
                     "FROM transaksi t " +
                     "JOIN kategori k ON t.id_kategori = k.id_kategori " +
                     "ORDER BY t.tanggal DESC";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

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

    public int countAll() {
        String sql = "SELECT COUNT(*) FROM transaksi";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}
