/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import model.User;
import util.KoneksiDB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet("/profile")
public class ProfileController extends BaseController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        render(req, resp, "/auth/profile.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        String nama = req.getParameter("nama");
        String email = req.getParameter("email");

        if (nama == null || email == null || nama.isBlank() || email.isBlank()) {
            req.setAttribute("error", "Nama dan email wajib diisi");
            render(req, resp, "/auth/profile.jsp");
            return;
        }

        try (Connection conn = KoneksiDB.getConnection()) {
            UserDAO userDAO = new UserDAO();

            user.setNamaLengkap(nama);
            user.setEmail(email);

            userDAO.updateProfile(user);

            // refresh session
            session.setAttribute("user", user);

            req.setAttribute("success", "Profil berhasil diperbarui");
            render(req, resp, "/auth/profile.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
