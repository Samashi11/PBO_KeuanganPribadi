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

@WebServlet("/transaksi")
public class TransaksiController extends BaseController {

    private final KategoriDAO kategoriDAO = new KategoriDAO();

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//            throws IOException {
//
//        req.setAttribute("kategoriList", kategoriDAO.findAll());
//
//        render(req, resp, "/pages/transaksi.jsp");
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // load data riwayat (transaksi)
        // TIDAK PERLU load anggaran
        // SIDEBAR SUDAH DIHANDLE FILTER
        forward(req, resp, "/index.jsp?halaman=riwayat");
        req.setAttribute("activePage", "transaksi");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // nanti lewat Service
        redirect(resp, req.getContextPath() + "/riwayat");
    }
}
