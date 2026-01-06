package controller;

import dao.KategoriDAO;
import dao.TransaksiDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class DashboardController extends BaseController {

    private final TransaksiDAO transaksiDAO = new TransaksiDAO();
    private final KategoriDAO kategoriDAO = new KategoriDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // === DATA KHUSUS DASHBOARD ===
            req.setAttribute("totalTransaksi", transaksiDAO.countAll());
            req.setAttribute("totalKategori", kategoriDAO.countAll());
//            req.setAttribute("rekapBulanan", transaksiDAO.rekapBulanan());

            render(req, resp, "/pages/dashboard.jsp");

        } catch (Exception e) {
            throw new RuntimeException("Gagal load dashboard", e);
        }
    }
}
