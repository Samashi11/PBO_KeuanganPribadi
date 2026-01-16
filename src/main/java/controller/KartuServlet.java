package controller;

import dao.KartuDAO;
import model.Kartu;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/kartu")
public class KartuServlet extends HttpServlet {
    private KartuDAO kartuDAO = new KartuDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        // Ambil list kartu user
        req.setAttribute("listKartu", kartuDAO.findByUserId(user.getIdUser()));
        req.getRequestDispatcher("mycards.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        if ("tambah".equals(action)) {
            // Tambah kartu baru
            Kartu kartu = new Kartu();
            kartu.setIdUser(user.getIdUser());
            kartu.setJenisKartu(req.getParameter("jenis"));
            kartu.setNamaKartu(req.getParameter("nama_kartu"));
            kartu.setNomorKartuMasked(req.getParameter("nomor_masked"));
            kartu.setNamaPemilik(req.getParameter("nama_pemilik"));
            kartu.setBank(req.getParameter("bank"));
            
            String exp = req.getParameter("tanggal_exp");
            if (exp != null && !exp.isEmpty()) {
                kartu.setTanggalExp(LocalDate.parse(exp));
            }

            kartuDAO.insert(kartu);
        } else if ("hapus".equals(action)) {
            int idKartu = Integer.parseInt(req.getParameter("id_kartu"));
            kartuDAO.softDelete(idKartu, user.getIdUser());
        }

        resp.sendRedirect("kartu");
    }
}