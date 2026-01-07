package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public abstract class BaseController extends HttpServlet {

    protected void render(HttpServletRequest req,
            HttpServletResponse resp,
            String contentPage)
            throws IOException {
        try {
            req.setAttribute("contentPage", contentPage);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new IOException("Gagal render halaman", e);
        }
    }

    protected void forward(HttpServletRequest req,
            HttpServletResponse resp,
            String jsp)
            throws ServletException, IOException {

        req.getRequestDispatcher(jsp)
                .forward(req, resp);
    }

    protected void redirect(HttpServletResponse resp, String url)
            throws IOException {

        resp.sendRedirect(url);
    }

}
