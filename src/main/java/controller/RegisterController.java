package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.KoneksiDB;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Jika sudah login, redirect ke dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }
        
        // Tampilkan form registrasi
        request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String namaLengkap = request.getParameter("namaLengkap");
        String email = request.getParameter("email");
        
        // Validasi input
        String error = validateRegistration(username, password, confirmPassword, namaLengkap, email);
        
        if (error != null) {
            request.setAttribute("errorMessage", error);
            request.setAttribute("username", username);
            request.setAttribute("namaLengkap", namaLengkap);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
            return;
        }
        
        try (Connection conn = KoneksiDB.getConnection()) {
            UserDAO userDAO = new UserDAO(conn);
            
            // Coba registrasi
            int newUserId = userDAO.registerUser(username, password, namaLengkap, email);
            
            if (newUserId > 0) {
                // Auto login setelah registrasi berhasil
                User newUser = userDAO.findById(newUserId);
                
                if (newUser != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", newUser);
                    
                    // Redirect ke dashboard
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                    return;
                }
            }
            
            request.setAttribute("errorMessage", "Registrasi gagal. Silakan coba lagi.");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
        }
        
        // Kembali ke form dengan data yang diisi
        request.setAttribute("username", username);
        request.setAttribute("namaLengkap", namaLengkap);
        request.setAttribute("email", email);
        request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
    }
    
    private String validateRegistration(String username, String password, String confirmPassword, 
                                       String namaLengkap, String email) {
        if (username == null || username.trim().isEmpty()) {
            return "Username harus diisi";
        }
        
        if (username.length() < 3) {
            return "Username minimal 3 karakter";
        }
        
        if (!username.matches("^[a-zA-Z0-9_]+$")) {
            return "Username hanya boleh mengandung huruf, angka, dan underscore";
        }
        
        if (password == null || password.trim().isEmpty()) {
            return "Password harus diisi";
        }
        
        if (password.length() < 6) {
            return "Password minimal 6 karakter";
        }
        
        if (!password.equals(confirmPassword)) {
            return "Password dan konfirmasi password tidak cocok";
        }
        
        if (namaLengkap == null || namaLengkap.trim().isEmpty()) {
            return "Nama lengkap harus diisi";
        }
        
        if (email == null || email.trim().isEmpty()) {
            return "Email harus diisi";
        }
        
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Format email tidak valid";
        }
        
        return null;
    }
}