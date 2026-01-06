/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import util.KoneksiDB;
import model.Anggaran;
import model.Kategori;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Transaksi;

public class AnggaranDAO {

    public Anggaran findByKategori(int idKategori) throws SQLException {

        String sql =
            "SELECT a.*, k.nama_kategori, k.tipe" +
            "FROM anggaran a" +
            "JOIN kategori k ON a.id_kategori = k.id_kategori" +
            "WHERE a.id_kategori = ?";

        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, idKategori);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Kategori k = new Kategori();
                k.setIdKategori(idKategori);
                k.setNamaKategori(rs.getString("nama_kategori"));
                k.setTipe(rs.getString("tipe"));

                Anggaran a = new Anggaran();
                a.setIdAnggaran(rs.getInt("id_anggaran"));
                a.setKategori(k);
                a.setJumlahAnggaran(rs.getBigDecimal("jumlah_anggaran"));
                a.setSisaAnggaran(rs.getBigDecimal("sisa_anggaran"));

                return a;
            }
        }
        return null;
    }
    
    public List<Anggaran> findAll() throws SQLException {

        List<Anggaran> list = new ArrayList<>();

        String sql
                = "SELECT * FROM anggaran a ORDER BY a.jumlah_angggaran DESC";

        try (Connection c = KoneksiDB.getConnection(); Statement s = c.createStatement(); ResultSet rs = s.executeQuery(sql)) {

            while (rs.next()) {

                Anggaran a = new Anggaran();
                a.setIdAnggaran(rs.getInt("id_anggaran"));
                a.setJumlahAnggaran(rs.getBigDecimal("jumlah_anggaran"));
                a.setSisaAnggaran(rs.getBigDecimal("sisa_anggaran"));

                list.add(a);
            }
        }
        return list;
    }

}

