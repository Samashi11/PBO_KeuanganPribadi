/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AnggaranDAO;
import dao.UserDAO;
import model.User;
import util.KoneksiDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class AuthController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/login".equals(path)) {
            handleLogin(request, response);
        }
    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String path = request.getServletPath();
//
//        if ("/logout".equals(path)) {
//            handleLogout(request, response);
//        }
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/login".equals(path)) {
            request.getRequestDispatcher("/auth/login.jsp")
                    .forward(request, response);
            return;
        }

        if ("/logout".equals(path)) {
            handleLogout(request, response);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 🔴 Guard clause – jangan percaya input
        if (username == null || password == null
                || username.isBlank() || password.isBlank()) {

            request.setAttribute("error", "Username dan password wajib diisi");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = KoneksiDB.getConnection()) {

            UserDAO userDAO = new UserDAO(conn);
            User user = userDAO.authenticate(username, password);

            if (user == null) {
                request.setAttribute("error", "Username atau password salah");
                request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                return;
            }

            // ✅ LOGIN BERHASIL
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            AnggaranDAO anggaranDAO = new AnggaranDAO();

            if (!anggaranDAO.existsByUserId(user.getIdUser())) {
                anggaranDAO.generateDefaultAnggaran(user.getIdUser());
            }

            // Optional tapi sehat
            session.setMaxInactiveInterval(30 * 60); // 30 menit

            response.sendRedirect(request.getContextPath() + "/dashboard");

        } catch (Exception e) {
            throw new ServletException("Login error", e);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect(request.getContextPath() + "/login");
    }
}
