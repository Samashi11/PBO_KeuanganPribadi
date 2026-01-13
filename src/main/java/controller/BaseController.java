package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.AnggaranDAO;
import model.Anggaran;
import model.User;

import java.io.IOException;
import java.util.List;

public abstract class BaseController extends HttpServlet {

    private final AnggaranDAO anggaranDAO = new AnggaranDAO();

    protected void prepareSidebar(HttpServletRequest req) {
        Object obj = req.getSession(false).getAttribute("user");

        if (obj == null) {
            return; // belum login, jangan inject apa-apa
        }

        User user = (User) obj;

        List<Anggaran> anggaranList
                = anggaranDAO.findByUserId(user.getIdUser());

        req.setAttribute("listAnggaran", anggaranList);
    }

    protected void render(HttpServletRequest req,
            HttpServletResponse resp,
            String contentPage)
            throws IOException {
        try {
            prepareSidebar(req); // ⬅️ KUNCI UTAMA
            req.setAttribute("contentPage", contentPage);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new IOException("Gagal render halaman", e);
        }
    }

    protected void forward(HttpServletRequest req,
            HttpServletResponse resp,
            String jsp)
            throws IOException, ServletException {
        prepareSidebar(req); // optional, tapi konsisten
        req.getRequestDispatcher(jsp).forward(req, resp);
    }

    protected void redirect(HttpServletResponse resp, String url)
            throws IOException {
        resp.sendRedirect(url);
    }
}
