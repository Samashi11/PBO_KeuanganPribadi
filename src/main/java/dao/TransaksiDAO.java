package dao;

import model.Transaksi;
import model.Kategori;
import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransaksiDAO {

    public void insert(Transaksi t) throws SQLException {

        String insertTransaksi =
            "INSERT INTO transaksi (tanggal, jumlah, keterangan, id_kategori) " +
            "VALUES (?, ?, ?, ?)";

        String updateAnggaran =
            "UPDATE anggaran " +
            "SET sisa_anggaran = sisa_anggaran - ? " +
            "WHERE id_kategori = ?";

        try (Connection c = KoneksiDB.getConnection()) {
            c.setAutoCommit(false);

            try (PreparedStatement ps = c.prepareStatement(insertTransaksi)) {
                ps.setDate(1, Date.valueOf(t.getTanggal()));
                ps.setBigDecimal(2, t.getJumlah());
                ps.setString(3, t.getKeterangan());
                ps.setInt(4, t.getKategori().getIdKategori());
                ps.executeUpdate();
            }

            if ("PENGELUARAN".equals(t.getKategori().getTipe())) {
                try (PreparedStatement ps = c.prepareStatement(updateAnggaran)) {
                    ps.setBigDecimal(1, t.getJumlah());
                    ps.setInt(2, t.getKategori().getIdKategori());
                    ps.executeUpdate();
                }
            }

            c.commit();
        }
    }

    public List<Transaksi> findAll() throws SQLException {

        List<Transaksi> list = new ArrayList<>();

        String sql =
            "SELECT t.id_transaksi, t.tanggal, t.jumlah, t.keterangan, " +
            "k.id_kategori, k.nama_kategori, k.tipe " +
            "FROM transaksi t " +
            "JOIN kategori k ON t.id_kategori = k.id_kategori " +
            "ORDER BY t.tanggal DESC";

        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Kategori k = new Kategori();
                k.setIdKategori(rs.getInt("id_kategori"));
                k.setNamaKategori(rs.getString("nama_kategori"));
                k.setTipe(rs.getString("tipe"));

                Transaksi t = new Transaksi();
                t.setIdTransaksi(rs.getInt("id_transaksi"));
                t.setTanggal(rs.getDate("tanggal").toLocalDate());
                t.setJumlah(rs.getBigDecimal("jumlah"));
                t.setKeterangan(rs.getString("keterangan"));
                t.setKategori(k);

                list.add(t);
            }
        }
        return list;
    }

    public int countAll() throws SQLException {
        String sql = "SELECT COUNT(*) FROM transaksi";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            rs.next();
            return rs.getInt(1);
        }
    }
}
