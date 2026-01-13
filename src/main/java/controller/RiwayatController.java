/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.TransaksiDAO;
import dao.KategoriDAO;
import model.Transaksi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import model.User;

@WebServlet("/riwayat")
public class RiwayatController extends BaseController {

    private final TransaksiDAO transaksiDAO = new TransaksiDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        User user = (User) req.getSession(false).getAttribute("user");

        if (user != null) {
            req.setAttribute("transaksiList",
                    transaksiDAO.findByUserId(user.getIdUser()));
        }

        req.setAttribute("activePage", "reports");
        render(req, resp, "/pages/riwayat.jsp");

    }
}
