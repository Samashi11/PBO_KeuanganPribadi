/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.TransaksiDAO;
import dao.KategoriDAO;
import model.Transaksi;
import model.Kategori; 

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet("/transaksi")
public class TransaksiController extends BaseController {

    private final KategoriDAO kategoriDAO = new KategoriDAO();
    private final TransaksiDAO transaksiDAO = new TransaksiDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ==================================================================
        // 1. CEK APAKAH ADA PERMINTAAN HAPUS (DELETE)?
        // ==================================================================
        if ("delete".equals(action)) {
            try {
                String idStr = req.getParameter("id");
                int id = Integer.parseInt(idStr);
                transaksiDAO.delete(id);
                
                resp.sendRedirect(req.getContextPath() + "/riwayat");
                return; // Stop di sini
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect(req.getContextPath() + "/riwayat");
                return;
            }
        
        // ==================================================================
        // 2. CEK APAKAH ADA PERMINTAAN EDIT (AMBIL DATA LAMA)?
        // ==================================================================
        } else if ("edit".equals(action)) {
            try {
                String idStr = req.getParameter("id");
                int id = Integer.parseInt(idStr);
                
                // Ambil data lama dari database berdasarkan ID
                Transaksi t = transaksiDAO.findById(id);
                
                // Kirim data ini ke JSP biar form-nya terisi otomatis
                req.setAttribute("editData", t);
                
                // Kirim juga list kategori buat dropdown
                req.setAttribute("kategoriList", kategoriDAO.findAll());
                
                req.setAttribute("activePage", "transaksi");
                render(req, resp, "/pages/transaksi.jsp");
                return; // Stop di sini
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // ==================================================================
        // 3. KALAU BUKAN HAPUS & BUKAN EDIT, BERARTI BUKA FORM KOSONG (BARU)
        // ==================================================================
        try {
            // Ambil Data Kategori (Buat Dropdown Pilihan)
            req.setAttribute("kategoriList", kategoriDAO.findAll());
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("activePage", "transaksi");
        render(req, resp, "/pages/transaksi.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {
            // A. AMBIL DATA DARI FORM HTML
            // Cek apakah ada ID (hidden input). Kalau ada = Update, Kalau tidak = Insert
            String idStr = req.getParameter("id"); 
            
            String keteranganStr = req.getParameter("keterangan");
            String jumlahStr = req.getParameter("jumlah");
            String tanggalStr = req.getParameter("tanggal");
            String kategoriIdStr = req.getParameter("kategori_id");

            // B. KONVERSI TIPE DATA
            Date tanggal = Date.valueOf(tanggalStr);
            BigDecimal jumlah = new BigDecimal(jumlahStr);
            int kategoriId = Integer.parseInt(kategoriIdStr);

            // C. MENYIAPKAN OBJEK
            Kategori k = new Kategori();
            k.setIdKategori(kategoriId);

            Transaksi t = new Transaksi();
            t.setKeterangan(keteranganStr);
            t.setJumlah(jumlah);
            t.setTanggal(tanggal);
            t.setKategori(k);
            
            // D. LOGIKA CABANG: UPDATE ATAU INSERT?
            if (idStr != null && !idStr.isEmpty()) {
                // --- KASUS EDIT (UPDATE) ---
                int id = Integer.parseInt(idStr);
                t.setIdTransaksi(id); // Set ID biar DAO tau baris mana yg diupdate
                
                transaksiDAO.update(t); // Panggil method UPDATE
            } else {
                // --- KASUS BARU (INSERT) ---
                t.setIdUser(1); // ID User cuma perlu pas insert (Sementara Hardcode 1)
                transaksiDAO.insert(t); // Panggil method INSERT
            }

            // E. SUKSES -> KEMBALI KE RIWAYAT BIAR LIHAT HASILNYA
            resp.sendRedirect(req.getContextPath() + "/riwayat");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Gagal proses transaksi: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/transaksi?status=error");
        }
    }
}

// tes update git