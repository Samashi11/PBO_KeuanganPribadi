package controller;

import dao.KategoriDAO;
import dao.TransaksiDAO;
import dao.AnggaranDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

@WebServlet("/dashboard")
public class DashboardController extends BaseController {

    private final TransaksiDAO transaksiDAO = new TransaksiDAO();
    private final AnggaranDAO anggaranDAO = new AnggaranDAO();
    private final KategoriDAO kategoriDAO = new KategoriDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        User user = (User) req.getSession(false).getAttribute("user");

        if (user != null) {
            req.setAttribute("totalTransaksi",
                    transaksiDAO.countByUserId(user.getIdUser()));
            req.setAttribute("totalAnggaran",
                    anggaranDAO.countByUserId(user.getIdUser()));
            req.setAttribute("totalKategori",
                    kategoriDAO.countByUserId(user.getIdUser()));
        }

        req.setAttribute("activePage", "dashboard");
        render(req, resp, "/pages/dashboard.jsp");
    }
}
