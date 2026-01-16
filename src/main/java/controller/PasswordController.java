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

@WebServlet("/change-password")
public class PasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cek session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }

        // Tampilkan form ganti password
        request.getRequestDispatcher("/auth/change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validasi input
        String error = validatePasswords(currentPassword, newPassword, confirmPassword);

        if (error != null) {
            request.setAttribute("errorMessage", error);
            request.getRequestDispatcher("/auth/change-password.jsp").forward(request, response);
            return;
        }

        try (Connection conn = KoneksiDB.getConnection()) {
            UserDAO userDAO = new UserDAO();

            // Coba ganti password
            boolean success = userDAO.changePassword(
                    user.getIdUser(),
                    currentPassword,
                    newPassword
            );

            if (success) {
                // Refresh user data dari database
                User updatedUser = userDAO.findById(user.getIdUser());
                session.setAttribute("user", updatedUser);

                request.setAttribute("successMessage", "Password berhasil diubah!");
            } else {
                request.setAttribute("errorMessage", "Password saat ini salah!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Terjadi kesalahan sistem. Silakan coba lagi.");
        }

        request.getRequestDispatcher("/auth/change-password.jsp").forward(request, response);
    }

    private String validatePasswords(String current, String newPass, String confirm) {
        if (current == null || current.trim().isEmpty()) {
            return "Password saat ini harus diisi";
        }

        if (newPass == null || newPass.trim().isEmpty()) {
            return "Password baru harus diisi";
        }

        if (confirm == null || confirm.trim().isEmpty()) {
            return "Konfirmasi password harus diisi";
        }

        if (!newPass.equals(confirm)) {
            return "Password baru dan konfirmasi tidak cocok";
        }

        if (newPass.length() < 6) {
            return "Password baru minimal 6 karakter";
        }

        // Password baru harus berbeda dengan password lama
        if (newPass.equals(current)) {
            return "Password baru harus berbeda dengan password lama";
        }

        return null;
    }
}
