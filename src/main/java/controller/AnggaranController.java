/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnggaranDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import model.Anggaran;
import model.User;

/**
 *
 * @author user
 */
@WebServlet("/anggaran")
public class AnggaranController extends BaseController {

    private final AnggaranDAO anggaranDAO = new AnggaranDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // ambil anggaran milik user
        List<Anggaran> anggaranList = anggaranDAO.findByUserId(user.getIdUser());

        req.setAttribute("anggaranList", anggaranList);
        req.setAttribute("activePage", "anggaran");
        render(req, resp, "/pages/anggaran.jsp");
//        request.getRequestDispatcher("/pages/anggaran.jsp").forward(request, response);
    }
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//            throws IOException {
//
//        User user = (User) req.getSession(false).getAttribute("user");
//
//        if (user == null) {
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }
//
//        req.setAttribute(
//                "anggaranList",
//                anggaranDAO.findByUserId(user.getIdUser())
//        );
//
//        req.setAttribute("activePage", "anggaran");
//        render(req, resp, "/pages/anggaran.jsp");
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        User user = (User) req.getSession(false).getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            int idAnggaran = Integer.parseInt(req.getParameter("id_anggaran"));
            BigDecimal jumlah = new BigDecimal(req.getParameter("jumlah"));

            anggaranDAO.updateJumlahAnggaran(
                    idAnggaran,
                    user.getIdUser(),
                    jumlah
            );

            resp.sendRedirect(req.getContextPath() + "/anggaran");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/anggaran?error=true");
        }
    }
}
