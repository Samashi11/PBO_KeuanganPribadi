/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.TransaksiDAO;
import dao.KategoriDAO;
import model.Transaksi;
import model.Kategori; // Wajib import Model Kategori

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal; // Wajib import BigDecimal
import java.sql.Date;

@WebServlet("/transaksi")
public class TransaksiController extends BaseController {

    private final KategoriDAO kategoriDAO = new KategoriDAO();
    private final TransaksiDAO transaksiDAO = new TransaksiDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1. Load Data Kategori (Untuk Dropdown Pilihan di Form)
        try {
            req.setAttribute("kategoriList", kategoriDAO.findAll());
        } catch (Exception e) {
            e.printStackTrace();
            // Kalau database error, halaman tetap jalan tapi dropdown kosong
        }

        // ... kodingan atas tetap sama ...
        req.setAttribute("activePage", "transaksi");
        render(req, resp, "/pages/transaksi.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {
            // A. AMBIL DATA DARI FORM HTML
            String keteranganStr = req.getParameter("keterangan");
            String jumlahStr = req.getParameter("jumlah");
            String tanggalStr = req.getParameter("tanggal");
            String kategoriIdStr = req.getParameter("kategori_id");

            // B. KONVERSI TIPE DATA
            // 1. Ubah String tanggal jadi SQL Date
            Date tanggal = Date.valueOf(tanggalStr);

            // 2. Ubah String jumlah jadi BigDecimal (Sesuai Model Transaksi kamu)
            BigDecimal jumlah = new BigDecimal(jumlahStr);

            // 3. Ubah String ID jadi Integer
            int kategoriId = Integer.parseInt(kategoriIdStr);

            // C. MENYIAPKAN OBJEK KATEGORI
            // Karena Model Transaksi butuh Objek Kategori, bukan cuma angka ID.
            Kategori k = new Kategori();
            k.setIdKategori(kategoriId); // Sesuai dengan Kategori.java kamu

            // D. MENYIAPKAN OBJEK TRANSAKSI
            Transaksi t = new Transaksi();
            t.setKeterangan(keteranganStr); // Sesuai Model Transaksi
            t.setJumlah(jumlah);            // Sesuai Model Transaksi (BigDecimal)
            t.setTanggal(tanggal);          // Sesuai Model Transaksi
            t.setKategori(k);               // Masukkan objek kategori yang sudah dibuat tadi

            // E. SIMPAN KE DATABASE
            transaksiDAO.insert(t);

            // F. SUKSES -> REFRESH HALAMAN
            resp.sendRedirect(req.getContextPath() + "/transaksi");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Gagal simpan transaksi: " + e.getMessage());

            // Kalau gagal, kembalikan ke halaman transaksi dengan pesan error (opsional)
            resp.sendRedirect(req.getContextPath() + "/transaksi?status=error");
        }
    }
}
