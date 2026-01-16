/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AnggaranDAO;
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
import java.util.List;
import model.User;

@WebServlet("/transaksi")
public class TransaksiController extends BaseController {

    private final KategoriDAO kategoriDAO = new KategoriDAO();
    private final TransaksiDAO transaksiDAO = new TransaksiDAO();
    private final AnggaranDAO anggaranDAO = new AnggaranDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ==================================================================
        // 1. CEK APAKAH ADA PERMINTAAN HAPUS (DELETE)?
        // ==================================================================
        if ("delete".equals(action)) {

            int id = Integer.parseInt(req.getParameter("id"));
            User user = (User) req.getSession().getAttribute("user");

            Transaksi t = transaksiDAO.findById(id);

            if (t != null && "PENGELUARAN".equals(t.getKategori().getTipe())) {
                anggaranDAO.tambahAnggaran(
                        t.getKategori().getIdKategori(),
                        user.getIdUser(),
                        t.getJumlah()
                );
            }

            transaksiDAO.delete(id);

            resp.sendRedirect(req.getContextPath() + "/riwayat");
            return; // ⬅⬅⬅ INI KRITIS
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

        List<Transaksi> list = transaksiDAO.findByUserId(
                ((User) req.getSession().getAttribute("user")).getIdUser()
        );

        req.setAttribute("transaksiList", list);
        req.setAttribute("activePage", "transaksi");
        render(req, resp, "/pages/transaksi.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {
            String idStr = req.getParameter("id");
            String keteranganStr = req.getParameter("keterangan");
            String jumlahStr = req.getParameter("jumlah");
            String tanggalStr = req.getParameter("tanggal");
            String kategoriIdStr = req.getParameter("kategori_id");

            Date tanggal = Date.valueOf(tanggalStr);
            BigDecimal jumlahBaru = new BigDecimal(jumlahStr);
            int kategoriId = Integer.parseInt(kategoriIdStr);

            User user = (User) req.getSession().getAttribute("user");

            Kategori kategori = kategoriDAO.findById(kategoriId);

            Transaksi t = new Transaksi();
            t.setKeterangan(keteranganStr);
            t.setJumlah(jumlahBaru);
            t.setTanggal(tanggal);
            t.setKategori(kategori);

            // ==========================
            // INSERT
            // ==========================
            if (idStr == null || idStr.isEmpty()) {

                t.setIdUser(user.getIdUser());
                transaksiDAO.insert(t);

                if ("PENGELUARAN".equals(kategori.getTipe())) {
                    anggaranDAO.kurangiAnggaran(
                            kategoriId,
                            user.getIdUser(),
                            jumlahBaru
                    );
                }

            } // ==========================
            // UPDATE (EDIT)
            // ==========================
            else {
                int id = Integer.parseInt(idStr);
                t.setIdTransaksi(id);

                // 🔴 AMBIL DATA LAMA
                Transaksi old = transaksiDAO.findById(id);

                BigDecimal jumlahLama = old.getJumlah();
                BigDecimal delta = jumlahBaru.subtract(jumlahLama);

                transaksiDAO.update(t);

                if ("PENGELUARAN".equals(kategori.getTipe())) {
                    anggaranDAO.updateByDelta(
                            kategoriId,
                            user.getIdUser(),
                            delta
                    );
                }
            }

            resp.sendRedirect(req.getContextPath() + "/riwayat");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/transaksi?status=error");
        }
    }

}

// tes update git
