package controller;

import dao.AnggaranDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public abstract class BaseController extends HttpServlet {

    private final AnggaranDAO anggaranDAO = new AnggaranDAO();

    protected void render(HttpServletRequest req, HttpServletResponse resp, String page)
            throws IOException {

        try {
            // DATA GLOBAL (SELALU ADA)
            req.setAttribute("listAnggaran", anggaranDAO.findAll());

            // halaman konten utama
            req.setAttribute("contentPage", page);

            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException("Gagal render halaman", e);
        }
    }
}
