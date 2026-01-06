/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.TransaksiDAO;
import model.Transaksi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/transaksi")
public class TransaksiController extends BaseController {

    private TransaksiDAO transaksiDAO = new TransaksiDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Transaksi> list;
        try {
            list = transaksiDAO.findAll();
            req.setAttribute("listTransaksi", list);
            render(req, resp, "/pages/transaksi.jsp");
        } catch (SQLException e) {
            throw new ServletException("Gagal mengambil data transaksi", e);
        }

    }

}

