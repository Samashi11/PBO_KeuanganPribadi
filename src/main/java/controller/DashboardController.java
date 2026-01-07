package controller;

import dao.KategoriDAO;
import dao.TransaksiDAO;
import dao.AnggaranDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends BaseController {

    private final TransaksiDAO transaksiDAO = new TransaksiDAO();
    private final AnggaranDAO anggaranDAO = new AnggaranDAO();
    private final KategoriDAO kategoriDAO = new KategoriDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        req.setAttribute("totalTransaksi", transaksiDAO.countAll());
        req.setAttribute("totalAnggaran", anggaranDAO.countAll());
        req.setAttribute("totalKategori", kategoriDAO.countAll());

        render(req, resp, "/pages/dashboard.jsp");
        req.setAttribute("activePage", "dashboard");
    }
}

